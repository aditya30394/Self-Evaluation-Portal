require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  def setup
    @instructor = Instructor.new(name: "Example Instructor",
    email: "instructor@example.com",
    password: "foobar",
    password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @instructor.valid?
  end
  
  test "name should be present" do
    @instructor.name = "     "
    assert_not @instructor.valid?
  end
  
  test "email should be present" do
    @instructor.email = "     "
    assert_not @instructor.valid?
  end
  
  test "name should not be too long" do
    @instructor.name = "a" * 51
    assert_not @instructor.valid?
  end

  test "email should not be too long" do
    @instructor.email = "a" * 244 + "@example.com"
    assert_not @instructor.valid?
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[instructor@example,com instructor_at_foo.org
                            instructor.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @instructor.email = invalid_address
      assert_not @instructor.valid?, "#{invalid_address.inspect} 
      should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_instructor = @instructor.dup
    duplicate_instructor.email = @instructor.email.upcase
    @instructor.save
    assert_not duplicate_instructor.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @instructor.email = mixed_case_email
    @instructor.save
    assert_equal mixed_case_email.downcase, @instructor.reload.email
  end
  
  test "password should be present (nonblank)" do
    @instructor.password = @instructor.password_confirmation = " " * 6
    assert_not @instructor.valid?
  end

  test "password should have a minimum length" do
    @instructor.password = @instructor.password_confirmation = "a" * 5
    assert_not @instructor.valid?
  end
  
  test "authenticated? should return false for an instructor with nil digest" do
    assert_not @instructor.authenticated?('')
  end
  
end
