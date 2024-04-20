class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
      @question = Question.find(params[:id])
      render :show
  end

  # GET /questions/new
  def new
    @question = Question.new
    5.times { @question.answer_choices.build }
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    @question = Question.create!(content: params[:question][:content],
                                 correct_answer: params[:question][:correct_answer])

    respond_to do |format|
      if @question.save
        # Assign each answer choice to the question
        params[:question][:answer_choices_attributes].each do |index, answer_choice_params|
          content = answer_choice_params[:content]
          next if content.blank?  # Skip if content is blank or nil

          @question.answer_choices.create!(content: content)
        end

        format.html { redirect_to question_url(@question), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    if @question.present?
      @question.destroy
    end

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question_type, :content, :correct_answer, answer_choices_attributes: [:id, :content, :question_id])
    end
end
