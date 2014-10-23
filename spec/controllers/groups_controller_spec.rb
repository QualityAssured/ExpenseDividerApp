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

    it "should add owner to group membership" do
      post :create, owner_id: user.id, :group => { :group_name => 'testgrp' }
      expect(Groups_users.find_by(user_id: user.id).group_id).to eq(Group.first.id)
    end
  end

    describe "GET #edit" do
      let(:user) { User.first }
      let(:group) { FactoryGirl.create(:group, owner_id: user.id) }

      it "should return the correct response"do
      get :edit, id: group.id
      expect(response).to have_http_status(200)
      end

    it "should render the index template" do
      get :edit, id: group.id
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update"do
    let(:user) { User.first }
    let(:group) { FactoryGirl.create(:group, owner_id: user.id) }

    it "should return the correct response"do
      patch :update, id: group.id, member_username: user.username
      expect(response).to have_http_status(200)
    end

    it "should render the index template" do
      patch :update, id: group.id, member_username: user.username
      expect(response).to render_template :edit
    end

    it "should add user to group membership" do
      patch :update, id: group.id, member_username: user.username
      expect(Groups_users.find_by(user_id: user.id).group_id).to eq(group.id)
    end
  end

  describe "DELETE #destroy_multiple_members" do
    let(:user) { User.first }
    let!(:member1) { FactoryGirl.create(:user, username: "Jake", email: "jake@pro.be", password: "12345678", password_confirmation: "12345678") }
    let!(:member2) { FactoryGirl.create(:user, username: "Bob", email: "Bob@pro.be", password: "12345678", password_confirmation: "12345678") }
    let(:group) { FactoryGirl.create(:group, owner_id: user.id, group_name: "testgrp", users: [user,member1,member2]) }

    it "should delete multiple members at once" do
      patch :destroy_multiple_members, group_id: group.id, members_ids: member1.id.to_s+','+member2.id.to_s
      expect(Groups_users.all.count).to equal(1)

    end

  end

end
