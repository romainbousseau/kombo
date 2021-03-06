class UsersController < ApplicationController

  def index
    #TODO Add a good filter to have users who work_session the main skills and the optional skills, now we just have the main skills
    @work_session = WorkSession.new
    @user = User.new
    parameters = params[:skill][:name]
    index_of_separator = parameters.each_index.select{|i| parameters[i] == ""}.pop
    main_skills =  []
    other_skills = []
    skills = other_skills.empty? ? main_skills : main_skills + other_skills

    params[:skill][:name].each_with_index do |skill, index|
      if index_of_separator.zero?
          main_skills << skill unless skill.empty?
      else
        unless skill.empty?
          index < index_of_separator ? main_skills << skill : other_skills << skill
        end
      end
    end
    users_with_main_skills = policy_scope(User).tagged_with(main_skills, :any => true)

    #TODO Need to check how to filter users with main skills and optional skills without duplicates users
    user_with_optional_skills = policy_scope(User).tagged_with(other_skills, :any => true)

    @users = policy_scope(User).tagged_with(main_skills).to_a

    @users.include?(current_user) ? @users.delete(current_user) :  @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def dashboard
    @skills = current_user.tag_list
    @user = current_user
    @sessions = WorkSession.where(solver_user: @user)
    @kombos = @sessions.or(WorkSession.where(problem_user: @user))
    authorize @user
  end


  def edit
    @user = current_user(user_params)
    authorize @user
  end

  def update_profile
    @user = current_user(user_params)
    @user.update
    authorize @user
  end

def add_skill
  @sessions = WorkSession.where(current_user.id == params[:solver_user_id])
  @skills = current_user.tag_list
  @user = current_user
  skill = params[:skill][:name].reject{|skill| skill.blank?}
  @user.tag_list.add(skill)
  @kombos = @sessions.or(WorkSession.where(problem_user: @user))
  authorize @user

  if @user.save
    render :dashboard
  end
end

private
def user_params
params.require(:user).permit(:first_name, :last_name, :work_department, :profile_description, :photo)
end


end
