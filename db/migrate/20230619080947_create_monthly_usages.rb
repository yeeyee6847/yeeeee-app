class CreateMonthlyUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_usages do |t|
      t.references :yearly_usage, null: false, foreign_key: true
      t.references :month, null: false, foreign_key: true
      t.decimal :total_amount

      t.timestamps
    end

    change_column_default :monthly_usages, :total_amount, 0
  end
end
