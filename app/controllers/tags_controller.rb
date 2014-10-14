class TagsController < ApplicationController

  def new
    render :new
  end

  def create
    Tag.create(user_id: current_user.id, description: params[:description])
    render :new
  end

  def destroy_multiple
    tags_to_destroy = Tag.find(params[:tag_ids].split(','))
    tags_to_destroy.each do |t|
      if current_user.id == t.user_id
        t.destroy
      end
    end
    # Tag.destroy(params[:tag_ids].split(','))
    render :new
  end

end