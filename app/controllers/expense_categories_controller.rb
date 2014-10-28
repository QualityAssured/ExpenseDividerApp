class ExpenseCategoriesController < ApplicationController

  def new
    render :new
  end

  def create
    @group = Group.find(params[:group_id])
    @group.expense_categories << ExpenseCategory.create(description: params[:expensecategory][:description])
    render :new
  end

  def destroy
    @expensecategory = ExpenseCategory.find(params[:id])
    @expensecategory.destroy
    render :new
  end

  def index
    render :index
  end

end