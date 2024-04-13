require "test_helper"

class AnswerChoiceTest < ActiveSupport::TestCase
  def setup
    @question = questions(:one)
    @answer_choice = @question.answer_choices.build(content: "A", question_id: @question.id)
  end
  
  test "should be valid" do
    assert @answer_choice.valid?
  end
  
  test "question id should be present" do
    @answer_choice.question_id = nil
    assert_not @answer_choice.valid?
  end
  
  test "content should be present" do
    @answer_choice.content = ""
    assert_not @answer_choice.valid?
  end
  
  test "content should not be over 140 characters" do
    @answer_choice.content = "a"*141
    assert_not @answer_choice.valid?
  end
end
