class CreateCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :costs do |t|
      t.string :name
      t.integer :amount
      t.references :author, index: true

      t.timestamps
    end
  end
end
