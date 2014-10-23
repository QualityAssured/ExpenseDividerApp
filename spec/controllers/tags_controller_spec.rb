require 'rails_helper'

RSpec.describe TagsController, :type => :controller do

  login_user

  describe "GET #new" do

    it "should return the correct response" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "should render the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    let(:user) { User.first }

    it "should return the correct response" do
      ## The method below takes: a http verb (post), the controller action you want to send test and all required parameters to make that action work

      post :create, :tag => {description: "testtag"}
      expect(response).to have_http_status(200)
    end

    it "should render the index template" do
      post :create, :tag => {description: "testtag"}
      expect(response).to render_template :new
    end

    it "should save the tag and capitalize description" do
      post :create, :tag => {description: "testtag"}
      expect(Tag.all.count).to equal(1)
      expect(Tag.first.description).to eq("Testtag")
    end

    it "should set user_id to current user" do
      post :create, :tag => {description: "testtag"}
      expect(Tag.first.user_id).to eq(user.id)
    end
  end

  describe "DELETE #destroy_multiple" do
    let(:user) { User.first }
    let!(:tag1) { FactoryGirl.create(:tag, description: "tag1", user_id: user.id) }
    let!(:tag2) { FactoryGirl.create(:tag, description: "tag2", user_id: user.id) }
    let!(:tag3) { FactoryGirl.create(:tag, description: "tag3", user_id: user.id) }

    it "should delete multiple tags at once" do
      delete :destroy_multiple, tag_ids: tag1.id.to_s+','+tag2.id.to_s+','+tag3.id.to_s
      expect(Tag.all.count).to equal(0)
    end
  end


end
