class BillsController < ApplicationController

  before_action :validate_group, only: [ :create ]

  def new
    render :new
  end

  def create
    bill = Bill.create(user_id: current_user.id, total: params[:total], description: params[:description], group_id: params[:groups_select])

   if params[:tags_with_amount_per_user] != nil
    tags_per_user = params[:tags_with_amount_per_user][0].to_hash

    tags_per_user.each do |user_with_tags|
      user_id = user_with_tags[0]
      tags_with_amount = user_with_tags[1]

      tags_with_amount.each do |tag, amount|
        bill.tags_with_amounts.create(amount: amount, user_to_pay_id: user_id, tag_name: tag)
      end
     end
    end

    render :new
  end

  def index
    render :index
  end

  private

  def validate_group
    if !current_user.groups.map(&:id).include? params[:groups_select].to_i
      flash[:error] = "Failed to create the bill."
      render :new
      return
    end
  end
end