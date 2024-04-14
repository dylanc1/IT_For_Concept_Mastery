class AnswersController < ActionController::Base
  def new
    @answer = Answer.new
  end
  
  def submit
    @answer_choice = AnswerChoice.find_by(id:  params[:answer_choice_id])
    if check(@answer_choice)
      flash[:success] = "Correct!"
      
    else
      flash[:danger] = "Incorrect :("
    end
    redirect_to request.referrer
  end
  
  private
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
    
  def check(answer_choice)
    @question = Question.find_by(id: answer_choice.question_id)
    return answer_choice.content == @question.correct_answer
  end
  
end
  