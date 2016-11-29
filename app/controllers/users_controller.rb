class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    @match = Match.new
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
