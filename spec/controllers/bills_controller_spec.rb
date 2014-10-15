require 'rails_helper'

RSpec.describe BillsController, :type => :controller do
  login_user

  describe 'GET #new' do
    it "does something" do
    get :new
    expect(response).to be_success
  end
  end

  describe 'GET #create' do

  end

end
