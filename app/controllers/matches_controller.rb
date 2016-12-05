class MatchesController < ApplicationController
  before_action :set_match, only: [ :show, :edit, :update, :validate, :decline, :done ]

  def show
    @message = Message.new
    @conversation = Message.where(match_id: @match.id)
    authorize @match
  end

  def new
    @match = Match.new
    @user = User.new
    authorize @match
  end

  def create
    parameters = params[:match]
    @solver_user = User.find(parameters[:solver_user_id].to_i)
    @problem_user = current_user
    @match = Match.new(match_params)
    @match.problem_user = @problem_user
    @match.solver_user = @solver_user
    authorize @match
    if @match.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  def edit
    authorize @match
  end

  def update
    authorize @match
    if @match.update
      redirect_to @match
    else
      render :edit
    end
  end

  def validate
  authorize @match
  @match.update(status: "validate")
  redirect_to match_path(@match)
end

def decline
  authorize @match
  @match.update(status: "decline")
  redirect_to match_path(@match)
end

def done
  authorize @match
  @match.update(status: "done")
  redirect_to match_path(@match)
end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:solver_user_id, :problem_user_id, :brief, :status)
  end
end
