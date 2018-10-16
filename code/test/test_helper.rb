require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def is_logged_in?
    !session[:instructor_id].nil?
  end
  
  def log_in_as(instructor)
    session[:instructor_id] = instructor.id
  end
  
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest

  def log_in_as(instructor, password: '123456', remember_me: '1')
    post login_path, params: { session: { email: instructor.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end