class Skill < ApplicationRecord
    has_many :question_assignments, dependent: :destroy
    has_many :questions, through: :question_assignments
    
    def next_question(current_question)
        all_questions = questions
        
        current_id = all_questions.find_index(current_question)
        
        if current_id.nil?
            return nil
        else
            next_id = (current_id + 1) % all_questions.length
            return all_questions[next_id]
        end
    end
end
