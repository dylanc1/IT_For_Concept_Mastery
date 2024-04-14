require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = Question.new(content: "Lorem ipsum?", correct_answer: "dolor sit amet")
  end
  
  test "should be valid" do
    assert @question.valid?
  end
  
  test "associated answer choices should be destroyed" do
    @question.save
    @question.answer_choices.create!(content: "Lorem ipsum")
    assert_difference 'AnswerChoice.count', -1 do
      @question.destroy
    end
  end
  
end
