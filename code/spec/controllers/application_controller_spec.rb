require 'spec_helper'
describe ApplicationController, :type => :controller do
  #protect_from_forgery with: :exception
  include SessionsHelper
  it "should render html" do 
    #get :hello
    #expect(response).to redirect_to root_url
    #render
    #render.should contain("Hello world!")
    #expect(response).to render_template("Hello, world!")
    #response.should render_template("Hello, world!")
  end
end



# 2  def hello
#     render html: "hello, world!"
#   end
