class MatchesController < ApplicationController
  before_action :set_match, only: [ :show, :edit, :update ]

  def show
    authorize @match
  end

  def new
    @match = Match.new
    authorize @match
  end

  def create
    @match = Match.new(match_params)
    authorize @match
    if @match.save
      redirect_to @match
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

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:user_skills_id, :user_id, :starts_at, :brief, :duration, :accepted)
  end
end
