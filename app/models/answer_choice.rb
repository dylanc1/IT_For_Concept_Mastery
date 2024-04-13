class AnswerChoice < ApplicationRecord
  belongs_to :question
  default_scope-> { order(created_at: :asc) }
  validates :question_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
