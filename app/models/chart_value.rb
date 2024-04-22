class ChartValue < ApplicationRecord
  belongs_to :question
  default_scope-> { order(created_at: :asc) }
  validates :question_id, presence: true
  validates :label, presence: true
  validates :height, presence: true
end
