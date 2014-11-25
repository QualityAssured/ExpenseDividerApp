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

    before(:each) do
      @category_attributes = { :expensecategory => {:description => "testdescription", :group_id => group.id}}
    end

    it "should return the correct response" do
      post :create, @category_attributes
      expect(response).to have_http_status(302)
    end

    it "should render the index template" do
      post :create, @category_attributes
      expect(response).to redirect_to edit_group_path(group.id)
    end

    it "should save the group" do
      post :create, @category_attributes
      expect(ExpenseCategory.all.count).to equal(1)
    end

    it "should add Expense Category to Group" do
      post :create, @category_attributes
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

  describe "DELETE #destroy_multiple" do
    let(:user) { User.first }
    let!(:group1)           { FactoryGirl.create(:group,id: 1, owner_id: user.id)}
    let!(:expensecategory1) { FactoryGirl.create(:expense_category, description: "desc1", group_id: 1) }
    let!(:expensecategory2) { FactoryGirl.create(:expense_category, description: "desc2", group_id: 1) }
    let!(:expensecategory3) { FactoryGirl.create(:expense_category, description: "desc3", group_id: 1) }

    it "should delete multiple categories at once" do
      delete :destroy_multiple, categories_ids: expensecategory1.id.to_s+','+expensecategory2.id.to_s+','+expensecategory3.id.to_s
      expect(ExpenseCategory.all.count).to equal(0)
    end
  end

end