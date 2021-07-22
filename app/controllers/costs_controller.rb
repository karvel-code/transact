class CostsController < ApplicationController
    def index
    end

    def new
        @group_options = Group.all.map{|group_option|[group_option.name]}
        @cost = Cost.new
    end

    def create
    end

    private
    def cost_params
        params.require(:cost).permit(:name, :amount)
    end 
end
