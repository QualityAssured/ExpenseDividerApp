class BillsController < ApplicationController

  def new
    render :new
  end

  def create

    tags = params[:tags_with_amount_per_user].to_s
    Bill.create(user_id: current_user.id, total: params[:total], tags: tags, description: params[:description])

    render :created
  end

  def index
     render :index
  end

end