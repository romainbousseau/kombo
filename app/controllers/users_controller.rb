class UsersController < ApplicationController

  def index
    @match = Match.new
    filtered_search = params[:skill][:name].reject{|skill| skill.blank?}
    @users = policy_scope(User).tagged_with(filtered_search)match
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def dashboard
    @user = current_user
    authorize @user
  end
end
