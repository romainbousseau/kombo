class UsersController < ApplicationController

  def index
    #TODO Add a good filter to have users who match the main skills and the optional skills, now we just have the main skills
    @match = Match.new
    parameters = params[:skill][:name]
    index_of_separator = parameters.each_index.select{|i| parameters[i] == ""}.pop
    main_skills =  []
    other_skills = []
    all_skills = main_skills + other_skills
    params[:skill][:name].each_with_index do |skill, index|
      unless skill.empty?
        index < index_of_separator ? main_skills << skill : other_skills << skill
      end
    end
    users_with_main_skills = policy_scope(User).tagged_with(main_skills, :match_all => true)

    user_with_optional_skills = policy_scope(User).tagged_with(other_skills, :any => true)

    @users = policy_scope(User).tagged_with(main_skills, :match_all => true).where("id > ?", 1) 
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
