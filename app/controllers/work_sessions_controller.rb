class WorkSessionsController < ApplicationController
  before_action :set_work_session, only: [ :show, :edit, :update, :validate, :decline, :done ]

  def show
    @message = Message.new
    # @conversation = Message.where(work_session_id: @work_session.id)
    authorize @work_session
  end

  def new
    @work_session = WorkSession.new
    @user = User.new
    authorize @work_session
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

  def create
    @solver_user = User.find(params[:work_session][:solver_user_id])
    @problem_user = current_user
    @work_session = WorkSession.new(work_session_params)
    @work_session.problem_user = @problem_user
    @work_session.solver_user = @solver_user
    authorize @work_session
    if @work_session.save
      redirect_to work_session_path(@work_session)
    else
      render :new
    end
  end

  def edit
    authorize @work_session
  end

  def update
    authorize @work_session
    if @work_session.update
      redirect_to @work_session
    else
      render :edit
    end
  end

  def validate
    authorize @work_session
    @work_session.update(status: "validate")
    redirect_to work_session_path(@work_session)
  end

  def decline
    authorize @work_session
    @work_session.update(status: "decline")
    redirect_to work_session_path(@work_session)
  end

  def done
    authorize @work_session
    @work_session.update(status: "done")
    @solver_user = @work_session.solver_user
    @solver_user.points += 50
    @solver_user.save
    redirect_to work_session_path(@work_session)
  end

  private

  def set_work_session
    @work_session = WorkSession.find(params[:id])
  end

  def work_session_params
    params.require(:work_session).permit(:solver_user_id, :problem_user_id, :brief, :starts_at, :status)
  end
end
