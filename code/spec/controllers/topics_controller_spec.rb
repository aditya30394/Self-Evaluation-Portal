# require 'rails_helper'

# RSpec.describe TopicsController, type: :controller do
#     before(:each) do
#     @instructor = Instructor.new( :name => "Example Instructor", 
#     :email => "instructor@example.com", 
#     :password => "foobar", 
#     :password_confirmation => "foobar")
#     end
    
#     # it do
#     #     params = {
#     #       instructor: {
#     #         name: 'John',
#     #         email: 'johndoe@example.com',
#     #         password: 'password',
#     #         password_confirmation: 'password'
#     #       }
#     #     }
#     #     should permit(:name, :email, :password, :password_confirmation).for(:instructor_params, params: params).on(:instructor)
#     # end
    
#      it { should permit(:name, :email, :password, :password_confirmation).for(:instructor_params) }
    
# end


# # Minitest (Shoulda)
# class UsersControllerTest < ActionController::TestCase
#   setup do
#     create(:user, id: 1)
#   end

#   should "(for PATCH #update) restrict parameters on :user to :first_name, :last_name, :email, and :password" do
#     params = {
#       id: 1,
#       user: {
#         first_name: 'Jon',
#         last_name: 'Doe',
#         email: 'jondoe@example.com',
#         password: 'password'
#       }
#     }
#     matcher = permit(:first_name, :last_name, :email, :password).
#       for(:update, params: params).
#       on(:user)
#     assert_accepts matcher, subject
#   end
# end