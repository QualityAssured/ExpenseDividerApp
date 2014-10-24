class GroupsController < ApplicationController

  def new
    @group = Group.new
    render :new
  end

  def create
    if Group.create(owner_id: current_user.id, group_name: params[:group][:group_name]).valid?
      @group = Group.where(:owner_id => current_user.id,:group_name => params[:group][:group_name]).first
      current_user.groups << @group
      render :index
    else
      @group = Group.create(owner_id: current_user.id, group_name: params[:group][:group_name])
      render :action => "index"
    end
  end

  def edit
    @group = Group.find(params[:id])
    render :edit => @group
  end

  def update
    @group = Group.find(params[:id])
    if User.find_by_username(params[:member_username])
      if !@group.users.include?(User.find_by_username(params[:member_username]))
        @group.users << User.find_by_username(params[:member_username])
      end
    end
    render :edit
  end

  def destroy_multiple_members
    @group = Group.find(params[:group_id])
    members_ids = params[:members_ids].split(',')
    members_ids.each do |i|
     member = User.find(i)
     if member != User.find(@group.owner_id)
      @group.users.delete(member)
       end
    end
    render :edit
  end

  def index
    @group = Group.new
    render :index
  end

end