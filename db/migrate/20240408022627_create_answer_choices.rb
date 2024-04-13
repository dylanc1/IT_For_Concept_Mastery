class CreateAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_choices do |t|
      t.text :content
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
    add_index :answer_choices, [:question_id, :created_at]
  end
end
