class TagsController < ApplicationController

  def new
    render :new
  end

  def create
    Tag.create(user_id: current_user.id, description: params[:description])
    render :new
  end

  def destroy_multiple
    #TODO: Investigate if this could be dangerous
    # If a user fakes a post, with a tag id that does not belong to him, will it destroy another user's tag?
    Tag.destroy(params[:tag_ids].split(','))
    render :new
  end

end