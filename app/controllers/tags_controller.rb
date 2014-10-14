class TagsController < ApplicationController

  def new
    @tag = Tag.new
    render :new
  end

  def create
    if Tag.create(user_id: current_user.id, description: params[:tag][:description].to_s.capitalize).valid?
      @tag = Tag.where(:user_id => current_user.id, :description => params[:tag][:description].to_s.capitalize).first
      render :new
    else
      @tag = Tag.create(user_id: current_user.id, description: params[:tag][:description].to_s.capitalize)
      render :action => "new"
    end
  end

  def destroy_multiple
    @tag = Tag.new
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