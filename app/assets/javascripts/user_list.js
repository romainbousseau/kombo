$(document).ready(function(){
  $( ".user" ).first().addClass('user-blue');
  $('.user-grey').click(function () {
    $('.user-blue').removeClass('user-blue');
    $('user').addClass('user-grey');
    $(this).removeClass('user');
    $(this).addClass('user-blue');
  });
});
