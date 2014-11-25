class ExpenseCategoriesController < ApplicationController

  def new
    render :new
  end

  def create
    @group = Group.where(id: params[:expensecategory][:group_id]).first
    ExpenseCategory.create(description: params[:expensecategory][:description], group_id: params[:expensecategory][:group_id]).valid?
    redirect_to edit_group_path(@group.id)
  end

  def destroy
    @expensecategory = ExpenseCategory.find(params[:id])
    @expensecategory.destroy
    render :new
  end

  def destroy_multiple
    @expensecategory = ExpenseCategory.new
    category_to_destroy = ExpenseCategory.find(params[:categories_ids].split(','))
    category_to_destroy.each do |c|
      if current_user.id == c.group.owner_id
        c.destroy
      end
    end
    render :new
  end

  def index
    render :index
  end

end