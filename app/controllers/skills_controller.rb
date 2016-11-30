class SkillsController < ApplicationController

  def index
    @skills =  Skill.all
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :tag_list)
  end
end
