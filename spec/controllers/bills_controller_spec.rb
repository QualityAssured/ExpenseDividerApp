require 'rails_helper'

describe BillsController, :type => :controller do

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
      let(:tag) { FactoryGirl.create(:tag, user_id: user.id, description: "Bloemkool") }
      let(:group) { FactoryGirl.create(:group, owner_id: user.id) }

      it "should return the correct response" do
        ## The method below takes: a http verb (post), the controller action you want to send test and all required parameters to make that action work
        post :create, user_id: user.id, total: "10", description: "Winkel", groups_select: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
        expect(response).to have_http_status(200)
      end

      it "should render the new template" do
        post :create, user_id: user.id, total: "10", description: "Winkel", groups_select: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
        expect(response).to render_template :new
      end

      it "should save the bill" do
        post :create, user_id: user.id, total: "10", description: "Winkel", groups_select: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
        expect(Bill.all.count).to equal(1)
      end

      it "should save the tags_with_amount_per_user" do
        post :create, user_id: user.id, total: "10", description: "Winkel", groups_select: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
        expect(TagsWithAmount.all.count).to eq(1)
      end

      it "should link the bill to the user" do
        post :create, user_id: user.id, total: "10", description: "Winkel", groups_select: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
        expect(Bill.first.user_id).to equal(user.id)
      end

      it "should link the bill to the group" do
        post :create, user_id: user.id, total: "10", description: "Winkel", groups_select: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
        expect(Bill.first.group_id).to equal(group.id)
      end

      it "should link the tag_with_amount to the bill" do
        post :create, user_id: user.id, total: "10", description: "Winkel", groups_select: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]
        expect(TagsWithAmount.first.bill_id).to equal(Bill.first.id)
      end
    end
end
