class CreateYourModelNames < ActiveRecord::Migration[7.0]
  def change
    create_table :your_model_names do |t|
      t.integer :year
      t.decimal :total_amount

      t.timestamps
    end
  end
end
