module SkillsHelper
    def next_question(skill)
        if skill.questions.count > 0
            return skill.questions.first
        else
            return nil
        end
    end
end
