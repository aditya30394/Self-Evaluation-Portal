require 'test_helper'

class InstructorsEditTest < ActionDispatch::IntegrationTest
  def setup
    @instructor = instructors(:admin)
  end

  test "unsuccessful edit" do
    log_in_as(@instructor)
    get edit_instructor_path(@instructor)
    assert_template 'instructors/edit'
    patch instructor_path(@instructor), params: { instructor: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'instructors/edit'
  end
  
  test "successful edit" do
    log_in_as(@instructor)
    get edit_instructor_path(@instructor)
    assert_template 'instructors/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch instructor_path(@instructor), params: { instructor: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @instructor
    @instructor.reload
    assert_equal name,  @instructor.name
    assert_equal email, @instructor.email
  end
  
  test "successful edit with friendly forwarding" do
    get edit_instructor_path(@instructor)
    log_in_as(@instructor)
    assert_redirected_to edit_instructor_url(@instructor)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch instructor_path(@instructor), params: { instructor: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @instructor
    @instructor.reload
    assert_equal name,  @instructor.name
    assert_equal email, @instructor.email
  end
  
end
