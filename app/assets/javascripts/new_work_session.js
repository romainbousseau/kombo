$(document).ready(function(){
  $('.select-user-link').click(function(e) {
    e.preventDefault();
    $('.user-card').addClass('hidden');
    var userId = $(this).data("user-id");
    $('#user_card_' + userId).removeClass('hidden');
    $("#solver_id").val(userId)
  });

  listenSelectUser();

  listenSendBrief();

  $( ".user" ).first().addClass('user-blue');
  $('.user-grey').click(function () {
    $('.user-blue').removeClass('user-blue');
    $('user').addClass('user-grey');
    $(this).removeClass('user');
    $(this).addClass('user-blue');
  });
});

function listenSelectUser() {
  $('.choose-user').click(function (e) {
    e.preventDefault();
    $('#user-index').addClass('hidden');
    $('#brief').removeClass('hidden');
  });
}

function listenSendBrief() {
  $('.send-brief').click(function(e) {
    e.preventDefault();
    $('#brief').addClass('hidden');
    $('#datepicker').removeClass('hidden');
  });
}
