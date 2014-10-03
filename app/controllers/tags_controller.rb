class TagsController < ApplicationController

  def new
    render :new
  end

  def create
    Tag.create(name: params[:name], user_id: current_user.id)
    render :created
  end
end