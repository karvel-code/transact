class AddColumnsToCostGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :cost_groups, :cost_id, :integer
    add_column :cost_groups, :group_id, :integer
  end
end
