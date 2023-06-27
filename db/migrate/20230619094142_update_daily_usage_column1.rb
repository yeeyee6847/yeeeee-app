class UpdateDailyUsageColumn1 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :daily_usages, :daily_status_id, nil
    change_column_null :daily_usages, :daily_status_id, true
  end
end
