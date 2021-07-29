class CostsController < ApplicationController
    
    before_action :authenticate_user!

    def index
        @all_costs = Cost.all
        @grouped_costs = Cost.internal
        
    end
    
    def external
        @external_costs = Cost.external
    end

    def new
        @group_options = [['Not in any group' ,0 ]]
        @group_options += Group.all.map{|group_option|[group_option.name, group_option.id]}
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
