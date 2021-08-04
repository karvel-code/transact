class CostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @grouped_costs = Cost.internal
    @all_groups = Group.all.includes(:costs)
    @total = Cost.internal_total
  end

  def external
    @external_costs = Cost.external
    @total = Cost.external_total
  end

  def all_costs
    @all_costs = Cost.all
    @user_costs = current_user.costs
  end

  def new
    @group_options = [['Not in any group', 0]]
    @group_options += Group.all.map { |group_option| [group_option.name, group_option.id] }
    @cost = Cost.new
  end

  def create
    @cost = current_user.costs.build(cost_params)
    @group = Group.find_by(id: group_params[:group_id])
    @cost.groups << @group unless @group.nil?

    if @cost.save
      flash[:success] = 'Expense has been created successfully!'
      redirect_to costs_path
    else
      flash.now[:error] = @cost.errors.full_messages
      @group_options = [['Not in any group', 0]]
      @group_options += Group.all.map { |group_option| [group_option.name, group_option.id] }
      render :new
    end
  end

  private

  def cost_params
    params.require(:cost).permit(:name, :amount)
  end

  def group_params
    params.require(:cost).permit(:group_id)
  end
end
