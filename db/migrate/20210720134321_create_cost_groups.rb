class CreateCostGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :cost_groups do |t|
      t.timestamps
    end
  end
end
