class AddGraphContentToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :graph_content, :text, default: "Placeholder Title"
  end
end
