require 'rails_helper'

RSpec.describe ExpenseCategoriesController, :type => :controller do

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
    let!(:group) { FactoryGirl.create(:group, owner_id: user.id) }

    it "should return the correct response" do
      post :create, group_id: group.id, :expensecategory=> { :description => 'testdescription' }
      expect(response).to have_http_status(200)
    end

    it "should render the index template" do
      post :create, group_id: group.id, :expensecategory=> { :description => 'testdescription' }
      expect(response).to render_template :new
    end

    it "should save the group" do
      post :create, group_id: group.id, :expensecategory=> { :description => 'testdescription' }
      expect(ExpenseCategory.all.count).to equal(1)
    end

    it "should add Expense Category to Group" do
      post :create, group_id: group.id, :expensecategory=> { :description => 'testdescription' }
      expect(ExpenseCategory.find_by(group_id: group.id).group_id).to eq(Group.first.id)
    end
  end

  describe "DELETE #destroy" do

    let!(:expensecategory) { FactoryGirl.create(:expense_category) }
    it "should return the correct response" do
      post :destroy, id: expensecategory.id
      expect(response).to have_http_status(200)
    end

    it "should render the new template" do
      post :destroy, id: expensecategory.id
      expect(response).to render_template :new
    end

    it "should delete the expense category" do
      post :destroy, id: expensecategory.id
      expect(ExpenseCategory.all.count).to equal(0)
    end

  end
end