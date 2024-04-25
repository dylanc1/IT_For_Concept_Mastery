class AnswersController < ActionController::Base
  def new
    @answer = Answer.new
  end
  
  def submit
    if params[:answer_choice_id].nil?
      flash[:danger] = "Please select an option"
      redirect_to request.referrer
      return
    end
    
    score = params[:c].to_i
    attempts = params[:a].to_i
    
    @answer_choice = AnswerChoice.find_by(id:  params[:answer_choice_id])
    @question = Question.find_by(id:  params[:q])
    if check(@answer_choice)
      flash[:success] = "Correct!"
      if params[:q].to_i == attempts
        score += 1
        attempts += 1
      end
    else
      if @question.hint.nil? || @question.hint.length == 0
        flash[:danger] = "Incorrect :(" 
      else
        flash[:danger] = "Hint: " + @question.hint
      end
      if params[:q].to_i == attempts
        attempts += 1
      end
    end
    redirect_to quiz_skill_url(id: params[:s_id].to_i, q: params[:q].to_i, c: score, a: attempts)
  end
  
  def submit_text
    if params[:answer].nil? || params[:answer] == ''
      flash[:danger] = "Please submit a response"
      redirect_to request.referrer
      return
    end
    
    score = params[:c].to_i
    attempts = params[:a].to_i
    
    @question = Question.find_by(id: params[:q_id])
    if @question.correct_answer.downcase == params[:answer].downcase
      flash[:success] = "Correct!"
      if params[:q].to_i == attempts
        score += 1
        attempts += 1
      end
    else
      flash[:danger] = "Incorrect :("
      if params[:q].to_i == attempts
        attempts += 1
      end
    end
    redirect_to quiz_skill_url(id: params[:s_id].to_i, q: params[:q].to_i, c: score, a: attempts)
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
  