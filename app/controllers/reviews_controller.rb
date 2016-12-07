class ReviewsController < ApplicationController
before_action :find_work_session, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.work_session = @work_session

    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to user_dashboard_path(@work_session.problem_user) }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
   else
     respond_to do |format|
       format.html { render 'work_sessions/show' }
       format.js  # <-- idem
     end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :work_session_id)
  end

  def find_work_session
    @work_session = WorkSession.find(params[:work_session_id])
  end
end
