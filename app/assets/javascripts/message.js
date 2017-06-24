$(document).on('turbolinks:load', function() {

  $(function() {
    function buildHTML(message) {

    if (message.image) {
      var image = `<img src= ${ message.image } class="post-image">`
    } else {
      var image = ''
    };

      var html = `<ul class="chat__main__body">
                    <li class="chat__main__body__message">
                      <div class="chat__main__body__message__header">
                        <p class="chat__main__body__message__header--name">${ message.name }</p>
                        <p class="chat__main__body__message__header--then">${ message.created_at }</p>
                      </div>
                      <p class="chat__main__body__message--post">
                        ${ message.text }
                        <br>
                        ${ image }
                      </p>
                    </li>
                  </ul>`;
      return html;
    }


    $('#new_message').on('submit', function(e) {
      e.preventDefault();
      var message = new FormData($('#new_message').get(0));
      $.ajax({
        type:        'POST',
        url:         location.href,
        data:        message,
        dataType:    'json',
        processData: false,
        contentType: false
      })
      .done(function(data) {
        var html = buildHTML(data);
        $('.chat__main').append(html);
        $('#message_text').val("");
        $('#message_image').val("");
        $('input').prop('disabled', false);
      })
      .fail(function() {
        alert('メッセージが入力されていません。');
        $('input').prop('disabled', false);
      });
    });
  });

});

