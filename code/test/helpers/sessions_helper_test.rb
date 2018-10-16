require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @instructor = instructors(:admin)
    remember(@instructor)
  end

  test "current_instructor returns right instructor when session is nil" do
    assert_equal @instructor, current_instructor
    assert is_logged_in?
  end

  test "current_instructor returns nil when remember digest is wrong" do
    @instructor.update_attribute(:remember_digest, Instructor.digest(Instructor.new_token))
    assert_nil current_instructor
  end
end