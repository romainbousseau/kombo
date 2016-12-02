module MessagesHelper

  def current_user?
    message.user == current_user ? "message_from_current_user" : "message_from_other_user"
  end
end
