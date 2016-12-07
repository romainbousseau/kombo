$(document).ready(function(){
  $(".brief-text .fr-file").each(function(index, item) {
    var href = $(item).attr("href");
    var text = $(item).text();
    console.log(href);
    console.log(text);
    $(item).hide();
  });
});
