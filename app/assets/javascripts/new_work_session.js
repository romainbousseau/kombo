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

  listenStepOne();

  listenStepTwo();

  listenStepThree();

  $('#user-list').on("click", ".user-grey",  function () {
    $('.user-blue').removeClass('user-blue').addClass("user-grey");
    $(this).removeClass("user-grey").addClass('user-blue');
  });
});

function listenStepOne() {
  $('#step-one').click(function(e) {
    $('#user-index').removeClass('hidden');
    $('#brief').addClass('hidden');
    $('#datepicker').addClass('hidden');
    $('.step').removeClass('active')
    $('#step-one').addClass('active')
  });
}

function listenStepTwo() {
  $('#step-two').click(function(e) {
    $('#brief').removeClass('hidden');
    $('#user-index').addClass('hidden');
    $('#datepicker').addClass('hidden');
    $('.step').removeClass('active')
    $('#step-two').addClass('active')
  });
}

function listenStepThree() {
  $('#step-three').click(function(e) {
    $('#datepicker').removeClass('hidden');
    $('#user-index').addClass('hidden');
    $('#brief').addClass('hidden');
    $('.step').removeClass('active')
    $('#step-three').addClass('active')
  });
}

function listenSelectUser() {
  $('.choose-user').click(function (e) {
    e.preventDefault();
    $('#user-index').addClass('hidden');
    $('#brief').removeClass('hidden');
    $('.step').removeClass('active')
    $('#step-two').addClass('active')
  });
}

function listenSendBrief() {
  $('.send-brief').click(function(e) {
    e.preventDefault();
    $('#brief').addClass('hidden');
    $('#datepicker').removeClass('hidden');
    $('.step').removeClass('active')
    $('#step-three').addClass('active')
  });
}
