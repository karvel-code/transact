class GroupsController < ApplicationController
    before_action :authenticate_user!
    def new
        @group = Group.new
    end

    def create
    end

    private

    def group_params
        params.require(:group).permit(:name)
    end
end
