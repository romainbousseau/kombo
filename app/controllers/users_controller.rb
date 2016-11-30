class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    @match = Match.new
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :tag_list)
  end
end
