class InstructorsController < ApplicationController
  before_action :logged_in_instructor, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  before_action :correct_instructor,   only: [:edit, :update]
  before_action :admin_instructor,     only: [:new, :create, :destroy]

  def create
    @instructor = Instructor.new(instructor_params_create)
    @instructor.activated = false
    @instructor.password = "000000"
    @instructor.password_confirmation = "000000"
    if @instructor.save
      flash[:success] = "Create new instructor successfully."
      redirect_to @instructor
    else
      render 'new'
    end
  end

  def index
    @instructors = Instructor.paginate(page: params[:page], :per_page =>10)
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(instructor_params)
      flash[:success] = "Profile updated."
      redirect_to @instructor
    else
      render 'edit'
    end
  end

  def destroy
    Instructor.find(params[:id]).destroy
    flash[:success] = "Instructor deleted."
    redirect_to instructors_url
  end

  def activate
    @instructor = Instructor.new
  end

  def update_activate
    @instructors = Instructor.where({ email: params[:instructor][:email].downcase })
    if(@instructors.size == 0)
      @instructor = Instructor.new
      flash[:danger] = "Not eligible for signing up."
      redirect_to signup_url
    else
      @instructor = @instructors[0]
      if @instructor.activated
        flash[:danger] = "You have already signed up."
        redirect_to signup_url
      else
        @instructor.activated = true
        if @instructor.update_attributes(instructor_params)
          log_in @instructor
          flash[:success] = "Account Activated."
          redirect_to @instructor
        else
          render 'activate'
        end
      end
    end
  end

  private

  def instructor_params_create
    params.require(:instructor).permit(:name, :email, :admin)
  end

  def instructor_params
    params.require(:instructor).permit(:name, :email, :password,
                                       :password_confirmation, :admin)
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
