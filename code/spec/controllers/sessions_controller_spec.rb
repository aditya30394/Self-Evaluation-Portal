require 'spec_helper'

# describe SessionsController, :type => :controller do
  
#   it "should get new" do
#     # post login_path, params: { session: { email: instructor.email,
#     #                                       password: password,
#     #                                       remember_me: remember_me } }
#     get login_path
#     response.should be_success
#     #assert_response :success
#   end
# end

describe SessionsController, :type => :controller do
    context 'with user logged in' do
        it "destroy should work as expected" do
            post :destroy
            expect(response).to redirect_to root_url
        end
    end
    
    # describe "#create" do
    #     post :create
    #     it "should work well when instructor is nil" do
            
    #     end
        
    #     it "should work well when instructor is nil" do
            
    #     end
    # end
    
end



#   def create
# 13    instructor = Instructor.find_by(email: params[:session][:email].downcase)
# 13    if instructor && instructor.authenticate(params[:session][:password])
# 13      log_in instructor
# 13      params[:session][:remember_me] == '1' ? remember(instructor) : forget(instructor)
# 13      redirect_back_or instructor
#     else
#       flash.now[:danger] = 'Invalid email/password combination.'
#       render 'new'
#     end
#   end

