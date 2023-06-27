class UpdateDailyUsageColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_default :daily_usages, :daily_status_id, nil
    change_column_null :table_name, :column_name, true
  end
end
