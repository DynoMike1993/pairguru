$(document).on('ajax:success', '#new_comment', function(e, data){
  $('#comments').append(data.html);
  $('#comment_content').val('');
});

$(document).on('ajax:error', '#new_comment', function(e, data){
  // alert(data.responseText);
 $(this).html(data.responseText);
});

$(document).on('ajax:success', '.destroy-comment', function(e, data){
  $(this).closest('.comment').remove();
});
