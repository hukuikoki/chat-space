$(document).on('turbolinks:load', function(){
  $(function() {
    function buildHTML(user) {
      var html = `<li class= "add-group-user">
                    <div class= "chat-group-user__name"> ${ user.name } </div>
                    <a id="add_button" data-user-name = "${ user.name }" data-user-id = "${ user.id }" > 追加 </a>
                  </li>`
      return html;
    };

    function RemoveUserHTML(id, name) {
      var html = `<li class= "remove-group-user">
                  <input type= 'hidden' name= 'group[user_ids][]' value= " ${ id } ">
                  <p class= 'chat-group-user__name'> ${ name } </p>
                  <a id= 'remove_button'> 削除 </a>
                  </li>`
      return html;
    };

     $('#user-search-field').on('keyup', function(e) {
       input = $.trim($('#user-search-field').val());
       $('.add-group-user').remove();
       if (input.length !== 0) {
         $.ajax({
           type: 'GET',
           url: '/users/search',
           data: { keyword: input },
           dataType: 'json',
         })
         .done(function(data) {
           $.each(data, function(i, data) {
             html = buildHTML(data);
             $('#user-search-result').append(html);
           });
         })
         .fail(function(json){
           alert('グループを作成してください。');
         });
       };
     });

      $(document).on('click', '#add_button', function() {
        var user = $(this).parent();
        $(user).remove();
        var id = $(this).data('user-id');
        var name = $(this).data('user-name');
        var new_html = RemoveUserHTML(id, name);
        $(' #chat-group-users').append(new_html);
      });

      $(document).on('click','#remove_button',function() {
        $(this).parent().remove();
      });
  });
});
