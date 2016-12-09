//= require cable
//= require_self
//= require_tree .


this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#chat-content").removeClass('hidden');
    // si on vient de taper enter
      // on veut remplacer le ... par le contenu du message
    // sinon
      // on veut ajouter ... sauf si c'est déjà affiché
    console.log(data.message)
    if (data.message !== "...") {
      if (currentUserId !== data.user_id) {
        return $('#chat-content div:last-child').hide().parent().append(this.renderMessage(data));
      } else {
        return $('#chat-content').append(this.renderMessage(data));
      }
    } else {
      if ($('#chat-content div:last-child p:last-child').text().trim() === "...") {
        return false
      } else {
        var currentUserId = parseInt($('#chat-content').attr('class'));
        var messageSender = data.user_id
        if (currentUserId !== data.user_id) {
          return $('#chat-content').append(this.renderMessage(data));
        }
      }
    }



    // if (data.message === "...") {
    //   if ($('#chat-content div:last-child p:last-child').text().trim() === "...") {
    //     return false;
    //   } else {
    //     return $('#chat-content div:last-child').html(this.renderMessage(data));
    //   }
    // } else {
    //   if ($('#chat-content div:last-child p:last-child').text().trim() === "...") {
    //     return $('#chat-content div:last-child').html(this.renderMessage(data));
    //   } else {
    //     return $('#chat-content').append(this.renderMessage(data));
    //   }
    // }
  },

  renderMessage: function(data) {
    var currentUserId = parseInt($('#chat-content').attr('class'));
    var messageSender = data.user_id
    if (currentUserId === data.user_id) {
      return  "<div class='message_from_current_user'> " + "<p class='username'> " + data.user + " </p> " + "<p class='message_text'> " + data.message + " </p> " + " </div"
    } else {
      return  "<div class='message_from_other_user'> " + "<p class='username'> " + data.user + " </p> " + "<p class='message_text'> " + data.message + " </p> " + " </div"    }
    }
});
