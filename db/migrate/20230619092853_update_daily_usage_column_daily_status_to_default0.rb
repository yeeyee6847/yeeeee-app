class UpdateDailyUsageColumnDailyStatusToDefault0 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :daily_usages, :daily_status_id, 0
  end
end
