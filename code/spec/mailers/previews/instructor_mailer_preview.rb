# Preview all emails at http://localhost:3000/rails/mailers/instructor_mailer
class InstructorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/instructor_mailer/password_reset
  def password_reset
    InstructorMailerMailer.password_reset
  end

end
