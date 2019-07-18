$(function() {
  $(document).on('turbolinks:load', function() {
    function buildHtml(comment) {
      var html = `<div class="comment">
                    <div class="comment-user bold">${comment.user_name}</div>
                    <div class="comment-time">${comment.time}</div>
                    <div class="comment-text">${comment.text}</div>
                  </div>`
      return html;
    }
    $('#new_comment').on('submit', function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        data: formData,
        type: 'POST',
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data) {
        var html = buildHtml(data);
        $('.comments').append(html);
        $('#comment_text').val('');
      })
      .fail(function() {
        alert('error');
      })
      return false;
    })
  });
});
