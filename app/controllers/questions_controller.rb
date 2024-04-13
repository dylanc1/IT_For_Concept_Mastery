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
  end

  # GET /skills/1/edit
  def edit
  end
end
