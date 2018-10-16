# require 'spec_helper'

# describe InstructorsController do
  
#   before(:each) do
#     @instructor = instructors(:admin)
#     @other_instructor = instructors(:hang)
#   end
  
#   it "should redirect index when not logged in" do
#     get instructors_path
#     #redirect_to login_url
#     expect(response).to redirect_to(login_url)
#   end
  
#   it "should get new" do
#     get signup_path
#     expect(response).to redirect_to(:success)
#   end
  
#   it "should redirect edit when not logged in" do
#     get edit_instructor_path(@instructor)
#     assert_not flash.empty?
#     redirect_to login_url
#     #expect(response).to redirect_to(login_url)
#   end

#   it "should redirect update when not logged in" do
#     patch instructor_path(@instructor), params: { instructor: { name: @instructor.name,
#                                               email: @instructor.email } }
#     #assert_not flash.empty?
#     #assert_redirected_to login_url
#     expect(response).to redirect_to(login_url)
#   end
  
#   it "should redirect edit when logged in as wrong user" do
#     log_in_as(@other_instructor)
#     get edit_instructor_path(@instructor)
#     #assert flash.empty?
#     #assert_redirected_to root_url
#     expect(response).to redirect_to(root_url)
#   end

#   it "should redirect update when logged in as wrong user" do
#     log_in_as(@other_instructor)
#     patch instructor_path(@instructor), params: { instructor: { name: @instructor.name,
#                                               email: @instructor.email } }
#     #assert flash.empty?
#     #assert_redirected_to root_url
#     expect(response).to redirect_to(root_url)
#   end
  
#   it "should redirect destroy when not logged in" do
#     assert_no_difference 'Instructor.count' do
#       delete instructor_path(@instructor)
#     end
#     #assert_redirected_to login_url
#     expect(response).to redirect_to(root_url)
#   end

#   it "should redirect destroy when logged in as a non-admin" do
#     log_in_as(@other_instructor)
#     assert_no_difference 'Instructor.count' do
#       delete instructor_path(@instructor)
#     end
#     #assert_redirected_to root_url
#     expect(response).to redirect_to(root_url)
#   end
  
# end
