class CreateSpendingTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :spending_types do |t|
      t.string :value
      t.integer :position

      t.timestamps
    end
  end
end
