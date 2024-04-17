class SkillsController < ApplicationController
  before_action :set_skill, only: %i[ show edit update destroy ]

  # GET /skills or /skills.json
  def index
    @skills = Skill.all
  end

  # GET /skills/1 or /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end
  
  # GET /skills/1/quiz
  def quiz
    set_skill
    all_questions = @skill.questions
    if params[:q].nil?
      @curr_id = 0
      @curr_score = 0
      @curr_att = 0
    else
      if params[:q].to_i == all_questions.length
        redirect_to submit_quiz_path(c: params[:c].to_i, a: params[:a].to_i)
        return
      end
      @curr_id = params[:q].to_i % all_questions.length
      @curr_score = params[:c].to_i
      @curr_att = params[:a].to_i
    end
    @curr_question = all_questions[@curr_id]
  end
  
  def submit_quiz
    @curr_score = params[:c]
    @curr_att = params[:a]
  end

  # POST /skills or /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to skill_url(@skill), notice: "Skill was successfully created." }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1 or /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to skill_url(@skill), notice: "Skill was successfully updated." }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1 or /skills/1.json
  def destroy
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url, notice: "Skill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:name, :description)
    end
end
