$(function() {
  $(document).on('turbolinks:load', function() {
    function appendUser(user) {
      var html = `<div>${user.name}</div>`
      $('#member__search__result').append(html);
    }
    function appendErrMsg(msg) {
      var html = `<div>${msg}</div>`
      $('#member__search__result').append(html);
    }
    $('#member__search').on('mouseover', function() {
      var input = $('#member__search__field').val();
      $.ajax({
        type: 'GET',
        url: '/users',
        data: {keyword: input},
        dataType: 'json'
      })
      .done(function(users) {
        $('#member__search__result').empty();
        if (users.length !== 0) {
          users.forEach(function(user) {
            appendUser(user);
          });
        }
        else {
          appendErrMsg("ユーザーが見つかりません");
        }
      })
      .fail(function() {
        alert('ユーザーを検索できませんでした');
      })
    })
  });
});
