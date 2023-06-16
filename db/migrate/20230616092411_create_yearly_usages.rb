class CreateYearlyUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :yearly_usages do |t|
      t.integer :year
      t.decimal :total_amount

      t.timestamps
      
    end

    drop_table :your_model_names
  end
end
