class ProblemsController < ApplicationController
    before_action :logged_in_instructor, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  def new
    @topics = Topic.all
    @problem = Problem.new
    if(params[:topic_from])
      @problem[:topic_id] = params[:topic_from]
    end
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      flash[:success] = "Problem created."
      redirect_to @problem
    else
      render 'new'
    end
  end

  def index
    @problems = Problem.paginate(page: params[:page], :per_page =>10)
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update_attributes(problem_params)
      flash[:success] = "Problem updated."
      redirect_to @problem
    else
      render 'edit'
    end
  end

    def destroy
      topic = Problem.find(params[:id]).topic
      Problem.find(params[:id]).destroy
      flash[:success] = "Problem deleted."
      redirect_to topic
    end

  private

  def problem_params
    params.require(:problem).permit(:question, :answer, :remark, :topic_id)
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
