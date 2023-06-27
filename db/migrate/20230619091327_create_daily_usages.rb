class CreateDailyUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_usages do |t|
      t.references :monthly_usage, null: false, foreign_key: true
      t.references :daily_status, null: false, foreign_key: true
      t.decimal :total_amount

      t.timestamps
    end

    change_column_default :daily_usages, :total_amount, 0
  end
end
