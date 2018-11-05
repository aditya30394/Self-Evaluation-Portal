class InstructorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.instructor_mailer.password_reset.subject
  #
  def password_reset(instructor)
    @instructor = instructor
    mail to: instructor.email, subject: "Password reset"
  end
end
