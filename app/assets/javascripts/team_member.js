$(function() {
  $(document).on('turbolinks:load', function() {
    function appendUser(user) {
      var html = `<div class="member__search__result__list">
                    <div class="user__name">${user.name}</div>
                    <div class="member__add btn btn-outline-primary btn-sm">追加</div>
                  </div>`
      $('#member__search__result').append(html);
    }
    function appendMember(user) {
      var html = `<div class="team__member">
                    <input name='team[user_ids][]' type='hidden' value='${user.id}'>
                    <div class="user__name">${user.name}</div>
                    <div class="member__delete btn btn-outline-danger btn-sm">削除</div>
                  </div>`
      $('#team__members').append(html);
    }
    function appendErrMsg(msg) {
      var html = `<div>${msg}</div>`
      $('#member__search__result').append(html);
    }

    $('#member__search').on('click', function() {
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
            $('.member__search__result__list').on('click', '.member__add', function() {
              appendMember(user);
              $(this).parent().remove();
            })
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
    $("#team__members").on("click", ".member__delete", function() {
      $(this).parent().remove();
    });
  });
});
