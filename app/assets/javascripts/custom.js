$(function(){
  setTimeout(function(){
    $("#js-mail-left").animate({top:"450px"},1000).animate({left:"150px"},1000, function(){
      $(this).addClass('shadow');
    });
    $("#js-mail-right").animate({top:"450px"},2000).animate({right:"140px"},1000, function(){
      $(this).addClass('shadow');
    });
  }, 1000);

  setTimeout(function(){
    $('.home__descriptionMessage').fadeIn(2000);
  }, 5000);
});
