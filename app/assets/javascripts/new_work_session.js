$(document).ready(function(){
  var firstUserId = $('.first-user').data('user-id');
  $("#solver_id").val(firstUserId);
  $('.select-user-link').click(function(e) {
    e.preventDefault();
    $('.user-card').addClass('hidden');
    var userId = $(this).data("user-id");
    $('#user_card_' + userId).removeClass('hidden');
    $("#solver_id").val(userId)
  });

  listenSelectUser();

  $('#brief-editor').froalaEditor({
    height: 250
  });

  listenSendBrief();

  $('#user-list').on("click", ".user-grey",  function () {
    $('.user-blue').removeClass('user-blue').addClass("user-grey");
    $(this).removeClass("user-grey").addClass('user-blue');
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
