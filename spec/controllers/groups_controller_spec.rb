require 'rails_helper'

RSpec.describe GroupsController, :type => :controller do

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

      post :create, owner_id: user.id, :group => { :group_name => 'testgrp' }
      expect(response).to have_http_status(200)
    end

    it "should render the index template" do
      post :create, owner_id: user.id, :group => { :group_name => 'testgrp' }
      expect(response).to render_template :index
    end

    it "should save the group" do
      post :create, owner_id: user.id, :group => { :group_name => 'testgrp' }
      expect(Group.all.count).to equal(1)
    end

    it "should link the group to the user" do
      post :create, owner_id: user.id, :group => { :group_name => 'testgrp' }
      expect(Groups_users.all.count).to eq(1)
    end


    # it "should link the tag_with_amount to the bill" do
    #   post :create, user_id: user.id, total: "10", description: "Winkel", group_id: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
    #   expect(TagsWithAmount.first.bill_id).to equal(Bill.first.id)
    # end

  end
end
