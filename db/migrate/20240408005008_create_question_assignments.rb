class CreateQuestionAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :question_assignments do |t|
      t.references :question, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
