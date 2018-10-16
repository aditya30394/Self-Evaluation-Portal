require 'test_helper'

class InstructorsLoginTest < ActionDispatch::IntegrationTest
  def setup
    @instructor = instructors(:admin)
  end
  
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @instructor.email,
                                          password: '123456' } }
    assert is_logged_in?
    assert_redirected_to @instructor
    follow_redirect!
    assert_template 'instructors/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", instructor_path(@instructor)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", instructor_path(@instructor), count: 0
  end
  
  test "login with remembering" do
    log_in_as(@instructor, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@instructor, remember_me: '1')
    delete logout_path
    log_in_as(@instructor, remember_me: '0')
    assert_empty cookies['remember_token']
  end
  
end
