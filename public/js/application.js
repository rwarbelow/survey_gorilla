$(document).ready(function(){
  $('#new-question').hide();
  $('#create').hide();
  $('#add-option').hide();
  $('#options').hide();
  $('#responses').hide();

  $('#add').click(function(event){
    event.preventDefault();
    $('#add-question').hide();
    $('#new-question').show();
    $('#type').change(function(){
      var type = $(this).val();
      if (type == 'TextArea' || type == 'NumSlider' || type == 'PercentSlider' || type == 'ShortResponse') {
        $('#add-option').hide();
        $('#options').hide();
        $('#responses').hide();
        $('#create').show();
      }
      if (type == 'McRadio' || type == 'McCheck') {
        $('#create').show();
        $('#add-option').show();
        $('#options').show();
        $('#responses').hide();
        $('#add-option').click(function(){
          $('#options').append($('<p id="option"><input type="text" name="response" placeholder="Option"><button id="remove">Remove</button></p>'));
        });
        $('#options').on('click', '#remove', function(){
          $(this).parent().remove();
        });
      }
      // if (type == 'ShortResponse'){
      //   $("#create").show();
      //   $("#add-option").hide();
      //   $('#options').hide();
      //   $('#responses').show();
      // }
    });
    $('#create').click(function(){
      var url = $('#define').attr('action');
      var responses = [];
      $('#options p input[name="response"]').each(function(){
        responses.push($(this).val());
      });
      var data = $('#define').serializeArray();
      debugger;
      customData = jQuery.param(responses);
      console.log(customData);
      values = data + customData;
      $.post(url, values, function(){});
    });
  });
});
