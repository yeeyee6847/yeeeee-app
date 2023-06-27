class CreateDailyStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_statuses do |t|
      t.string :value
      t.integer :position

      t.timestamps
    end
  end
end
