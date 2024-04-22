class CreateChartValues < ActiveRecord::Migration[7.0]
  def change
    create_table :chart_values do |t|
      t.string :label
      t.integer :height
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
    add_index :chart_values, [:question_id, :created_at]
  end
end
