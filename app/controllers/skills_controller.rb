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
      if params[:q].to_i == all_questions.length || params[:c].to_i >= 5
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
    
    if logged_in?
      if current_user.skills.find_by(id: params[:id]).nil?
        current_user.skills << [Skill.find(params[:id])]
      end
      
      @user_skill = UserSkill.find_by(user_id: current_user.id, skill_id: params[:id])
      
      if @curr_score.to_f / @curr_att.to_f  > 0.8
        @user_skill.status = 2
      else
        @user_skill.status = 1
      end
      
      @user_skill.save
    end
  end

  # POST /skills or /skills.json
  def create
    @skill = Skill.new(skill_params)
    
    if @skill.save
      flash[:success] = "Skill was successfully created."
      redirect_to skill_url(@skill)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skills/1 or /skills/1.json
  def update
    if @skill.update(skill_params)
      flash[:success] = "Skill was successfully updated."
      redirect_to skill_url(@skill)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # DELETE /skills/1 or /skills/1.json
  def destroy
    @skill.destroy
    flash[:success] = "Skill was successfully removed."
    redirect_to skills_url, status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skill_params
      params.require(:skill).permit(:name, :description, question_ids: [])
    end
end
