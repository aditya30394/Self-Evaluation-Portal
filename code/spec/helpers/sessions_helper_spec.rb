require 'spec_helper'

describe SessionsHelper do
  
  before(:each) do
    @instructor = Instructor.new( :name => "Example Instructor", 
    :email => "instructor@example.com", 
    :password => "foobar", 
    :password_confirmation => "foobar")
     remember(@instructor)
  end
  
  
  it "should remember the instructor" do
    expect(cookies.permanent.signed[:instructor_id]).to eq(@instructor.id)
    expect(cookies.permanent[:remember_token]).to eq(@instructor.remember_token)
  end
  
  describe "current_instructor from cookies" do
    it "should return right instructor when session is nil" do
      
      instructor_id = cookies.signed[:instructor_id]
      @instructor = Instructor.find_by(id: instructor_id)
      @instructor.should_not be_nil
      expect(@instructor.authenticated?(cookies[:remember_token])).to be true
      
      #assert is_logged_in?
      expect(@instructor).to eq(current_instructor)
    end
  end
  
  describe "log_out" do
    it "should work well" do
      log_out()
      @current_instructor.should be_nil
    end
  end


end