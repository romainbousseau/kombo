$(document).ready(function(){
  $('.user').click(function () {
    $('.user-blue').toggleClass('user');
    $(this).removeClass('user');
    $(this).addClass('user-blue');
  });
});
