// $(document).ready(function() {
//   $('#create').on('submit', function(event){
//     event.preventDefault();
//     event.stopPropagation();
//     var url = $(this).attr('action');
//     $(this).hide();
//     $.get(url, function(data){
//       $('#top').append(data);
//     });
//   });

//   $('#top').on('submit', 'form', function(event){
//     event.preventDefault();
//     event.stopPropagation();
//     var url = $(this).attr('action');
//     var data = $(this).serialize();
//     $.post(url, data, function(response){
//       $('#notes').prepend(response);
//     });
//     $(this).remove();
//     $('#create').show();
//   });
//   // Delete
//     $('.delete').on('submit', function(event){
//     event.preventDefault();
//     event.stopPropagation();
//     var url = $(this).attr('action');
//     $(this).hide();
//     var that = $(this).parent();
//     $.get(url, function(data){
//       $(that).append(data);
//     });
//   });

//   $('.note').on('submit', '#yes', function(event){
//     event.preventDefault();
//     event.stopPropagation();
//     var url = $(this).attr('action');
//     $.post(url);
//     $(this).parent().remove();
//   });
// });

$(document).ready(function(){
  $('#new-question').hide();
  $('#create').hide();
  $('#add-option').hide();

  var option = $('<p><input type="text" name="response" placeholder="Option"></p>')
  
  $('#add').click(function(event){
    event.preventDefault();
    $('#new-question').show();
    $('#type').change(function(){
      var type = $(this).val();
      if (type == 'TextArea') {
        $('#add-option').hide();
        $('#create').show();
      }
      if (type == 'McRadio' || type == 'McCheck') {
        $('#create').hide();
        $('#add-option').show();
        $('#add-option').click(function(){
          $('#add-option').after(option);
          return false;
        });
      }
    });
  });
});
