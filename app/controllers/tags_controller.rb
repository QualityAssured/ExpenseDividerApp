class TagsController < ApplicationController

  def new
    render :new
  end

  def create
    Tag.create(user_id: current_user.id, description: params[:description])
    render :new
  end

  def destroy_multiple
    Tag.destroy(params[:tag_ids].split(','))
    render :new
  end

end