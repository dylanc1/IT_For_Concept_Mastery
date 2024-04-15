class Question < ApplicationRecord
    has_one :answer, dependent: :destroy
    has_many :answer_choices, dependent: :destroy
    has_many :question_assignments, dependent: :destroy
    has_many :skills, through: :question_assignments
    accepts_nested_attributes_for :answer_choices

    validates :content, presence: true, length: {maximum: 140}
    validates :correct_answer, presence: true, length: {maximum: 140}
end
