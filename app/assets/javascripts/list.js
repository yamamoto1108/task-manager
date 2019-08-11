$(document).on('turbolinks:load', function() {
  function buildHtml(list) {
    var html = `<div class="list">
                  <div class="list__name">
                    ${list.name}
                  </div>
                  <div class="list__icon">
                    <a data-remote="true" href="/boards/${list.board_id}/lists/${list.id}/edit">
                      <i class="fas fa-edit icon"></i>
                    </a>
                    <a data-dismiss="modal" data-confirm="リストを削除しますか？" data-commit="DELETE" data-cancel="Cancel" title="DELETE List" rel="nofollow" data-method="delete" href="/boards/${list.board_id}/lists/${list.id}">
                      <i class="fas fa-trash-alt icon"></i>
                    </a>
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
