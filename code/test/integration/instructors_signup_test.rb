require 'test_helper'

class InstructorsSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Instructor.count' do
      post instructors_path,  params: { instructor: { name:  "",
                                  email: "instructor@invalid",
                                  password:              "foo",
                                  password_confirmation: "bar" } }
    end
    assert_template 'instructors/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'Instructor.count', 1 do
      post instructors_path, params: { instructor: { name:  "Example Instructor",
                                         email: "instructor@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'instructors/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
  
end
