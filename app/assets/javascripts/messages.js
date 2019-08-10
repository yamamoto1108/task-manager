$(function() {
  $(document).on('turbolinks:load', function() {
    function buildHTML(message) {
      var html = `<div class="message" style="background-color: #EEFFFF;">
                    <div class="message__user">
                      ${ message.user_name }
                    </div>
                    <div class="message__date">
                      ${ message.created_at }
                    </div>
                    <div class="message__content">
                      ${ message.content }
                    </div>
                  </div>`
      return html;
    }

    $('#new_message').on('submit', function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(message) {
        var html = buildHTML(message);
        $('.room__messages').append(html);
        $('.room__post__form').val('');
        $('.room').animate({scrollTop: $('.room')[0].scrollHeight});
      })
      .fail(function() {
        alert('error');
      })
      return false;
    })
  });
});
