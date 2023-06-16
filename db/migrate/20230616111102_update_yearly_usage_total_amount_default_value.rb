class UpdateYearlyUsageTotalAmountDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :yearly_usages, :total_amount, 0
  end
end
