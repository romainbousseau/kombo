class MessagesController < ApplicationController
  before_action :find_match, only: [:show, :new, :create]

  def show
    @message = Message.find(params[:id])
    authorize @message
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.match = @match
    authorize @message

    if @message.save
     respond_to do |format|
       format.html { redirect_to match_path(@match) }
       format.js  # <-- will render `app/views/messages/create.js.erb`
     end
   else
     respond_to do |format|
       format.html { render 'matches/show' }
       format.js  # <-- idem
     end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_match
   @match = Match.find(params[:match_id])
  end
end
