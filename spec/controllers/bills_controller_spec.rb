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
      let!(:user) { User.first }
      let!(:other_user) { FactoryGirl.create(:user, username: 'Bob', email: 'bob@test.com') }
      let!(:tag) { FactoryGirl.create(:tag, user_id: user.id, description: "Bloemkool") }
      let!(:group) { FactoryGirl.create(:group, owner_id: user.id, users: [user]) }
      let!(:other_group) { FactoryGirl.create(:group, owner_id: other_user.id) }
      let!(:params) { {user_id: user.id, total: "10", description: "Winkel", group_id: group.id, tags_with_amount_per_user: [{ user.id => { tag.description => '20' }}]} }

      it "should return the correct response" do
        ## The method below takes: a http verb (post), the controller action you want to send test and all required parameters to make that action work
        post :create, params
        expect(response).to have_http_status(200)
      end

      it "should render the new template" do
        post :create, params
        expect(response).to render_template :new
      end

      it "should save the bill" do
        post :create, params
        expect(Bill.all.count).to equal(1)
      end

      it "should save the tags_with_amount_per_user" do
        post :create, params
        expect(TagsWithAmount.all.count).to eq(1)
      end

      it "should link the bill to the user" do
        post :create, params
        expect(Bill.first.user_id).to equal(user.id)
      end

      it "should link the bill to the group" do
        post :create, params
        expect(Bill.first.group_id).to equal(group.id)
      end

      it "should link the tag_with_amount to the bill" do
        post :create, params
        expect(TagsWithAmount.first.bill_id).to equal(Bill.first.id)
      end

      context "error handling" do

        before do
          params.merge!( {group_id: other_group.id} )
          post :create, params
        end

        it "should render an error when the current user does not belong to the group that was posted" do
          expect(flash[:error]).to eq('Failed to create the bill.')
        end

        it "should not save the bill" do
          expect(Bill.count).to eq(0)
        end

        it "should render bills#new" do
          expect(response).to render_template :new
        end
      end
    end
end
