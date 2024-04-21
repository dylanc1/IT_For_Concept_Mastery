class LearningController < ApplicationController
  def dashboard
    if !logged_in?
      redirect_to root_path
    end
  end

  def skills
  end
end
