class GroupsController < ApplicationController

  def new
    render :new
  end

  def create
    this_group = Group.create(owner_id: current_user.id, group_name: params[:group_name])
    current_user.groups << this_group
    render :index
  end

  def edit
    @group = Group.find(params[:id])
    render :edit => @group
  end

  def update
    @group = Group.find(params[:id])
    if !@group.users.include?(User.find_by_email(params[:member_email]))
      @group.users << User.find_by_email(params[:member_email])
    end
    render :edit
  end

  def destroy_multiple
    Tag.destroy(params[:tag_ids].split(','))
    render :new
  end

  def index
    render :index
  end

end