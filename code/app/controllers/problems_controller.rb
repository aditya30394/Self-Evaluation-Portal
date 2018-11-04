class ProblemsController < ApplicationController
    before_action :logged_in_instructor, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  def new
    @topics = Topic.all
    @question_types = QuestionType.all
    @problem = Problem.new
    if(params[:topic_from])
      @problem[:topic_id] = params[:topic_from]
    end
  end

  def create
    @problem = Problem.new(problem_params)
    
    if @problem.save
      flash[:success] = "Problem created."
      
      # Save options incase MCQ
      correct = params.require(:problem).permit(:correct)
      
      unless correct.nil? || correct == ""
        id = @problem.id
        
        logger.debug Problem.find_by_id id
        options = params.require(:problem).permit(:option => [:option0, :option1, :option2, :option3])
        
        options[:option].each do |key|
          option = Option.new()
          option.answer = options[:option][key]
          option.problem_id = id
          
          if correct[:correct] == key
            option.is_answer = true
          end
          option.save!
        end
      end
        
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
    params.require(:problem).permit(:question, :answer, :remark, :topic_id, :question_type_id)
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
