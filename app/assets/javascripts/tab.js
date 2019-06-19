$(function() {
  $(document).on('turbolinks:load', function () {
    $('.tab__menu').click(function() {
      var index = $('.tab__menu').index(this);
      $('.tab__menu').removeClass('active');
      $(this).addClass('active');
      $('.tab__area__contents').removeClass('show').eq(index).addClass('show');
    });
  });
});
