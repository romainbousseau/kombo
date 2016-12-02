class UsersController < ApplicationController

  def index
    @match = Match.new
    filtered_search = params[:skill][:name].reject{|skill| skill.blank?}
    @users = policy_scope(User).tagged_with(filtered_search)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def dashboard
    @skills = current_user.tag_list
    @user = current_user
    authorize @user
  end

def add_skill
  @skills = current_user.tag_list
  @user = current_user
  skill = params[:skill][:name].reject{|skill| skill.blank?}
  @user.tag_list.add(skill)
  authorize @user

  if @user.save
    render :dashboard
  end
end

end
