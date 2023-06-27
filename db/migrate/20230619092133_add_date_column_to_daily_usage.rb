class AddDateColumnToDailyUsage < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_usages, :date, :date
  end
end
