class ExpensecategoriesController < ApplicationController

  def new
    render :new
  end

  def create
    @group = Group.where(id: params[:expensecategory][:group_id]).first
      Expensecategory.create(description: params[:expensecategory][:description], group_id: params[:expensecategory][:group_id]).valid?
    redirect_to edit_group_path(@group.id)
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