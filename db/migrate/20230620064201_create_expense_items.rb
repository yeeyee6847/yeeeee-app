class CreateExpenseItems < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_items do |t|
      t.references :daily_usage, null: false, foreign_key: true
      t.references :spending_type, null: false, foreign_key: true
      t.string :expense_item
      t.decimal :amount
      t.text :remark

      t.timestamps
    end
  end
end
