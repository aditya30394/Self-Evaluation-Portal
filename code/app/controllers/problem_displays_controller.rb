class ProblemDisplaysController < ApplicationController
  def quiz
    @topics = Topic.all
  end

  def selected
    session[:topics] = params[:selected].select{|k,v| v=='1'}.keys.map{|v| v}
    session[:problems] = session[:topics].map{|v| Topic.find(v).problems.map{|w| w.id}}.flatten(1)
    session[:quiz_type] = params[:selected][:quiz_type]

    session[:current_problem] = 0


    if(session[:problems].size == 0)

    end

    if(session[:quiz_type] == "Flashcard")
      redirect_to(quiz_flashcard_question_url)
    else
      session[:answers] = Array.new(session[:problems].size,"")
      redirect_to(quiz_problem_url)
    end
  end

  def quiz_problem

    if(params[:nextid])
      @thisid = params[:nextid].to_i
    else
      @thisid = 0
    end
    session[:current_problem] = @thisid
    @lastanswer =  session[:answers][@thisid]

    @problem = Problem.find(session[:problems][@thisid])
  end

  def quiz_problem_answer

    if(params[:nextid])
      @thisid = params[:nextid].to_i
    else
      @thisid = 0
    end
    session[:current_problem] = @thisid
    @lastanswer =  session[:answers][@thisid]

    @problem = Problem.find(session[:problems][@thisid])
  end

  def save_answer
    @thisid = session[:current_problem]
    session[:answers][@thisid] = params[:student][:answer]
    @lastanswer =  session[:answers][@thisid]
    @problem = Problem.find(session[:problems][@thisid])
    render 'quiz_problem'
  end

  def quiz_flashcard_question
    if(params[:nextid])
      @thisid = params[:nextid].to_i
    else
      @thisid = 0
    end
    @problem = Problem.find(session[:problems][@thisid])
  end

  def quiz_flashcard_answer
    if(params[:nextid])
      @thisid = params[:nextid].to_i
    else
      @thisid = 0
    end
    @problem = Problem.find(session[:problems][@thisid])
  end

end
