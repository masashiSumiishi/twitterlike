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

  $("#toggle").click(function(){
    $("#menu").slideToggle();
    return false;
  });
  $(window).resize(function(){
    let win = $(window).width();
    let p = 750;
    if(win > p){
      $("#menu").show();
    }
  })
});
$('#micropost_picture').bind('change', function(){
  let size_in_megabytes = this.filse[0].size/1024/1024;
  if(size_in_megabytes > 5) {
    alert('upladできるサイズは5MBまでです。もっと小さくしてください！')
  }
})
