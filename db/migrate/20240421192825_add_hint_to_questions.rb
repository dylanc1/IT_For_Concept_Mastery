class AddHintToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :hint, :string
  end
end
