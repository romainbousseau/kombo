//= require cable
//= require_self
//= require_tree .


this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#chat-content").removeClass('hidden')
    return $('#chat-content').append(this.renderMessage(data));
  },

  renderMessage: function(data) {

    var currentUserId = parseInt($('#chat-content').attr('class'));
    var messageSender = data.user_id
    if (currentUserId === data.user_id) {
      console.log(messageSender);
      console.log(currentUserId);
      console.log(data.time);
      return  "<div class='message_from_current_user'> " + "<p class='username'> " + data.user + " </p> " + "<p class='message_text'> " + data.message + " </p> " + " </div"
    } else {
      console.log(messageSender);
      console.log(currentUserId);
      console.log(data.time);
      return  "<div class='message_from_other_user'> " + "<p class='username'> " + data.user + " </p> " + "<p class='message_text'> " + data.message + " </p> " + " </div"    }
  }
});
