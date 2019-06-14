$(function() {
  $(document).on('turbolinks:load', function() {
    function buildHtml(list) {
      var html = `<div class="list">
                    <div class="list__name">
                      ${list.name}
                    </div>
                  </div>`
      return html;
    }
    $('#new_list').on('submit', function(e) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data) {
        var html = buildHtml(data);
        $('.list__items').append(html);
        $('.list__form').val('');
      })
      .fail(function() {
        alert('error');
      })
      return false;
    });
  });
});
