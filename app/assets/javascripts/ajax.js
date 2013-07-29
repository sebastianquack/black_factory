$(document).ready(function() {

/*  $('#image_upload_form').on('ajax:success', function(evt, data) {
		$('#upload_thumbs').html(data);
	});
*/

	// 
	$('#imageupload').fileupload({
//			dataType: 'json',
			done: function (e, data) {
					
					/*
					$.each(data.result.files, function (index, file) {
					$('<img/>').attr({ 'src': file.thumb_url }).appendTo(document.body);
							$('<p/>').text(file.name).appendTo(document.body);				
					});*/
					
					$('#upload_thumbs').html(data.result);
					$('#progress .bar').html('');
					$('#progress .bar').css('width', '0%');

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