class LearningController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def dashboard
    if !logged_in?
      redirect_to root_path
    end
  end

  def skills
  end
  
  def draggable
    @yvals = [70, 24, 56]
  end
  
  def update
    if @yvals.nil?
      @yvals = [70, 24, 56]
    end
    if !params[:yval].nil? and !params[:i].nil?
      @yvals[params[:i].to_i] = params[:yval].to_i
    end
  end
end
