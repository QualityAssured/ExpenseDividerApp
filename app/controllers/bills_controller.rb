class BillsController < ApplicationController

  def new
    render :new
  end

  def create

    tags = params[:tagswithamount].to_s
    Bill.create(user_id: current_user.id, total: params[:total], tags: tags)

    render :created
  end

  def index
     render :index
  end

end