class MessagesController < ApplicationController
  before_action :find_work_session, only: [:show, :new, :create]

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
    @message.work_session = @work_session
    authorize @message

    if @message.save
      ActionCable.server.broadcast 'messages',
        message: @message.content,
        user: @message.user.first_name,
        user_id: @message.user.id,
        time: Time.now
      respond_to do |format|
        format.html { redirect_to work_session_path(@work_session) }
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

  def message_params
    params.require(:message).permit(:content, :work_session_id)
  end

  def find_work_session
     @work_session = WorkSession.find(params[:work_session_id])
  end
end
