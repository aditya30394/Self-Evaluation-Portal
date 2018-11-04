class PasswordResetsController < ApplicationController
  
  before_action :get_user,   only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end

  def create
    @instructor = Instructor.find_by(email: params[:password_reset][:email].downcase)
    if @instructor
      @instructor.create_reset_digest
      @instructor.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:user][:password].empty?
      @instructor.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @instructor.update_attributes(instructor_params)
      log_in @instructor
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = "Password has been reset."
      redirect_to @instructor
    else
      render 'edit'
    end
  end
  
  private

    def instructor_params
      params.require(:instructor).permit(:password, :password_confirmation)
    end
    
    def get_user
      @instructor = Instructor.find_by(email: params[:email])
    end
    
    # Checks expiration of reset token.
    def check_expiration
      if @instructor.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
