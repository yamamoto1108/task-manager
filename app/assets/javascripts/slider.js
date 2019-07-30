$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    autoplay: true,
    dots: true,
    prevArrow: '<button class="slide-arrow prev-arrow"></button>',
    nextArrow: '<button class="slide-arrow next-arrow"></button>',
    dotsClass: 'slide-dots'
  });
});
