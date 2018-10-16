module SessionsHelper
    
  def log_in(instructor)
    session[:instructor_id] = instructor.id
  end
  
  def remember(instructor)
    instructor.remember
    cookies.permanent.signed[:instructor_id] = instructor.id
    cookies.permanent[:remember_token] = instructor.remember_token
  end
  
  def current_instructor
    if (instructor_id = session[:instructor_id])
      @current_instructor ||= Instructor.find_by(id: instructor_id)
    elsif (instructor_id = cookies.signed[:instructor_id])
      instructor = Instructor.find_by(id: instructor_id)
      if instructor && instructor.authenticated?(cookies[:remember_token])
        log_in instructor
        @current_instructor = instructor
      end
    end
  end
  
  def logged_in?
    !current_instructor.nil?
  end
  
  def forget(instructor)
    instructor.forget
    cookies.delete(:instructor_id)
    cookies.delete(:remember_token)
  end
  
  def log_out
    forget(current_instructor)
    session.delete(:instructor_id)
    @current_instructor = nil
  end
  
  def current_instructor?(instructor)
    instructor == current_instructor
  end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
  
end
