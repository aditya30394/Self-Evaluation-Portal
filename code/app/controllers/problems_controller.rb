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
    
    # Problem is MCQ
    if @problem[:question_type_id] == 1
      options = option_params
      if !options[:options].nil? && !options[:correct].nil?
        # Save problem first to add options(Options belongs to Problems)
        if @problem.save
          flash[:success] = "Problem created."
          
          # Save all 4 options
          options[:options].each do |key|
            _is_answer = !options[:correct][key].nil?
            opt = @problem.options.create(answer: options[:options][key], is_answer: _is_answer)
            if opt.valid?
              # Option saved
            else
              flash[:danger] = "Options not saved properly."
            end
          end
          
          # Save any links
          save_link
          
          redirect_to @problem
        else
          flash[:danger] = "Unable to save Problem."
          redirect_to Problem.new
        end
      else
        flash[:danger] = "Provide answers and correct choices for MCQ."
        redirect_to Problem.new
      end
    # Problem is short answer type
    else
      if @problem[:answer].blank?
        flash[:danger] = "Answer can't be blank."
        redirect_to Problem.new
      elsif @problem.save
        flash[:success] = "Problem created."
        save_link
        
        redirect_to @problem
      else
        render 'new'
      end
    end
  end

  def index
    @problems = Problem.paginate(page: params[:page], :per_page =>10)
  end

  def show
    @problem = Problem.find(params[:id])
    @correct_answers = Array.new      
    if(@problem.question_type.question_type == "MCQ")
      @correct_answers = @problem.options.where("is_answer = true").pluck(:answer)
    end
    if(@problem.question_type.question_type == "Short Answer")
      @correct_answers.push(@problem.answer)
    end
  end

  def edit
    @problem = Problem.find(params[:id])
    @options = @problem.options
    @topics = Topic.all
    @question_types = QuestionType.all
    @links = @problem.links
  end

  def update
    @problem = Problem.find(params[:id])
    if problem_params[:question_type_id].to_i == 1
      options = option_params
      
      if !options[:options].nil? && !options[:correct].nil?
        if @problem.update_attributes(problem_params)
          flash[:success] = "Problem updated."
          
          @problem.options.destroy_all
          # Save all 4 options
          options[:options].each do |key|
            _is_answer = !options[:correct][key].nil?
            opt = @problem.options.create(answer: options[:options][key], is_answer: _is_answer)
            if opt.valid?
              # Option saved
            else
              flash[:danger] = "Options not saved properly."
            end
          end
          
          # Save any links
          update_link
              
          redirect_to @problem
        else
          render 'edit'
        end
      end
    else
      if problem_params[:answer].blank?
        flash[:danger] = "Answer can't be blank."
        redirect_to Problem.new
      elsif @problem.update_attributes(problem_params)
        @problem.options.destroy_all
        flash[:success] = "Problem updated."
        update_link
        
        redirect_to @problem
      else
        render 'new'
      end
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
  
  def option_params
    params.require(:problem).permit(:correct => [:option0, :option1, :option2, :option3], :options => [:option0, :option1, :option2, :option3])
  end
  
  def save_link
    link_param = params.require(:problem).permit(:link)
    
    if !link_param[:link].nil? && link_param[:link] != ""
      opt = @problem.links.create(link: link_param[:link])
      if opt
        # Link created
      else
        flash[:danger] = "Link not created."
      end
    end
  end
  
  def update_link
    link_param = params.require(:problem).permit(:link)
    
    if !link_param[:link].nil? && link_param[:link] != ""
      @problem.links.destroy_all
      opt = @problem.links.create(link: link_param[:link])
      if opt
        # Link created
      else
        flash[:danger] = "Link not created."
      end
    end
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
