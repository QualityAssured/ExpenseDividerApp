class ExpensecategoriesController < ApplicationController

  def new
    render :new
  end

  def create
    @group = Group.find(params[:group_id])
    @group.expensecategories << Expensecategory.create(description: params[:expensecategory][:description])
    render :new
  end

  def destroy
    @expensecategory = Expensecategory.find(params[:id])
    @expensecategory.destroy
    render :new
  end

  def index
    render :index
  end

end