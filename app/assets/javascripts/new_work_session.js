$(document).ready(function(){
  $('.select-user-link').click(function(e) {
    e.preventDefault();
    $('.user-card').addClass('hidden');
    var userId = $(this).data("user-id");
    $('#user_card_' + userId).removeClass('hidden');
  });

  listenSelectUser();

  $('#send-brief').click(function () {
    $('#brief').addClass('hidden');
    $('#datepicker').removeClass('hidden');
  });

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
    console.log(e.isDefaultPrevented());
    $('#user-index').addClass('hidden');
    $('#brief').removeClass('hidden');
    console.log('aie!')
  });
}
