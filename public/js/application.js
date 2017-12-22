$(document).ready(function() {

  $('#question_upvote').submit(function(e){
    e.preventDefault();

    $form = $(event.target)

    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize(),
      dataType: "JSON",
      success: function(response) {
        debugger
      },
    });
  });




});
