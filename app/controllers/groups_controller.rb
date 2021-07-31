class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @costs = @group.costs.includes(:author)
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.image.attach(params[:group][:image])

    if @group.save
      flash[:success] = "#{@group.name} Group has been created successfully!"
      redirect_to groups_path
    else
      flash.now[:error] = @group.errors.full_messages
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :image)
  end
end
