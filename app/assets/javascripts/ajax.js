function reset_image_events() {
	$('.image_preview_delete').unbind('click');
	$('.image_preview_delete').click(function(e) {
		e.preventDefault();
		$(this).parent().remove();
		$.ajax({
			url: $(this).attr('data-ajax-url'),
			dataType: "json",
			method: 'DELETE',
			success: function() {
				console.log('image deleted');
			}
		});
	});
}

$(document).ready(function() {

	$('#imageupload_button').fileupload({
			done: function (e, data) {
					$('#upload_thumbs').append(data.result);
					$('#progress .bar').html('');
					$('#progress .bar').css('width', '0%');
					reset_image_events();
			},
			progressall: function (e, data) {
				var progress = parseInt(data.loaded / data.total * 100, 10);
				$('#progress .bar').css(
						'width',
						progress + '%'
				);
				if(data.loaded == data.total) {
					$('#progress .bar').html('finishing...');
				}
		}
	});

  // fill <select> values from another select that triggered ajax
  $('select[data-targetselect]').on('change', function() {
    // get second selectbox by its id
    var selectbox2 = $('#' + $(this).attr('data-targetselect'));
    $.ajax({
	  url: $(this).attr('data-ajax-url'),
	  data: "challenge_id=" + $(this).val(),
	  dataType: "json",
	  success: function(data) {
	    if (!selectbox2.attr("data-initialselection")) selectbox2.attr("data-initialselection", selectbox2.val());
	    var initialselection = selectbox2.attr("data-initialselection");
		selectbox2.empty();
		var opt = $('<option/>');
		opt.attr('value', "");
		opt.text(" - ");
		opt.appendTo(selectbox2);		
		$.each(data, function(index, value) {
		  var opt = $('<option/>');
		  // use "name" and "id" fields from JSON object
		  if (initialselection == value.id) opt.attr('selected', 'selected');
		  opt.attr('value', value.id);
		  opt.text(value.name);
		  opt.appendTo(selectbox2);
		});		
	  }
	});
  });
  $('select[data-targetselect]').trigger("change");
  

});