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
    5.times { @question.chart_values.build }
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    @question = Question.create!(content: params[:question][:content],
                                 correct_answer: params[:question][:correct_answer], 
                                 question_type: params[:question][:question_type], 
                                 graph_content: params[:question][:graph_content],
                                 hint: params[:question][:hint])
    
    if @question.save
      # Assign each answer choice to the question
      params[:question][:answer_choices_attributes].each do |index, answer_choice_params|
        content = answer_choice_params[:content]
        next if content.blank?  # Skip if content is blank or nil
        
        @question.answer_choices.create!(content: content)
      end
      
      # check if any values for chart
      if !(params[:question][:chart_values_attributes].nil?)
        # assign if so
        params[:question][:chart_values_attributes].each do |index, chart_value_params|
          label = chart_value_params[:label]
          height = chart_value_params[:height]
          next if label.blank?  # Skip if content is blank or nil
          next if height.blank?  # Skip if content is blank or nil
          
          @question.chart_values.create!(label: label, height: height)
        end
      end
      
      flash[:success] = "Question was successfully created."
      redirect_to question_url(@question)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    if @question.present?
      @question.destroy
    end
    
    flash[:success] = "Question was successfully removed."
    redirect_to questions_url
  end
  
  private
    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question_type, :graph_content, 
      :content, :correct_answer, :hint, 
      answer_choices_attributes: [:id, :content, :question_id],
      chart_values_attributes: [:id, :label, :height, :question_id])
    end
end
