class Skill < ApplicationRecord
    has_many :question_assignments, dependent: :destroy
    has_many :questions, through: :question_assignments
end
