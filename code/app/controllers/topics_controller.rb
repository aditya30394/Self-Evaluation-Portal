class TopicsController < ApplicationController
    before_action :logged_in_instructor, only: [:new, :create, :show, :edit, :update, :index, :destroy]
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      log_in @topic
      flash[:success] = "Create topic successfully."
      redirect_to @topic
    else
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @problems = @topic.problems.paginate(page: params[:page], :per_page =>10)
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:success] = "Topic updated."
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def index
    @topics = Topic.paginate(page: params[:page], :per_page =>10)
  end

  def destroy
    Topic.find(params[:id]).destroy
    flash[:success] = "Topic deleted."
    redirect_to topics_url
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

  def instructor_params
    params.require(:instructor).permit(:name, :email, :password,
                                       :password_confirmation)
  end

  def logged_in_instructor
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_instructor
    @instructor = Instructor.find(params[:id])
    redirect_to(root_url) unless current_instructor?(@instructor)
  end

  def admin_instructor
    redirect_to(root_url) unless current_instructor.admin?
  end
end
