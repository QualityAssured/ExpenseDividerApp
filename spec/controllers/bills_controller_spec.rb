require 'rails_helper'

describe BillsController, :type => :controller do
#let(:user) {User.create(username: "jos", email: "jos.bos@blabla.com", password: "clip32", password_confirmation: "clip32")}
  login_user

  describe "GET #new" do
    it "should return the correct response" do

      #sign_in user
      get :new
      expect(response).to be_success
      #response.should be_success
    end


  end

  describe "POST #create" do

  end

end
