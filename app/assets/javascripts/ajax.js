function reset_image_events() {
	$('.image_preview_delete').unbind('click');
	$('.image_preview_delete').click(function(e) {
		e.preventDefault();
		$(this).parents(".media").remove();
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
					$('#image_thumbs').append(data.result);
					if($('#image_thumbs input[type=radio]').length == 1) {
						$('#image_thumbs input[type=radio]').attr('checked', 'checked');
					}
					$('#progress').hide();
					$('#imageupload_button_wrapper').fadeIn();
			},
			fail: function (e, data) {
				window.setTimeout(function () {
					$('#progress').hide();
					$('#imageupload_button_wrapper').fadeIn();
				}, 1000);			
			},
			always: function (e, data) {
					$('#progress .bar').html('');
					$('#progress .bar').css('width', '0%');
					reset_image_events();
			},
			progressall: function (e, data) {
				var progress = parseInt(data.loaded / data.total * 100, 10);
				$('#imageupload_button_wrapper').hide();
				$('#progress').show();
				$('#progress .bar').css(
						'width',
						progress + '%'
				);
				if(data.loaded == data.total) {
					$('#progress .bar').html('Einen Moment noch...');
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
  
  initUploadButton();

	// save star form html for later reconstruction
  $(".star-form").each( function(i,obj) {
		$(obj).attr('data-orig-html', $(obj).html());
	});
  
  initStarRating();

  $('#designs').mixitup({
  	onMixStart: function () {
			$(".shade").remove();
  	},  	
		onMixEnd: function () {

		// reconstruct html, upadte to new state and reinitialize star-rating plugin
	  $(".star-form").each( function(i,obj) {
			$(obj).html($(obj).attr('data-orig-html'));
			var selected = $(obj).attr('data-selected');
			if (typeof selected != "undefined") {
				$(obj).find(".auto-submit-star").each( function (i,radio) {
					if ($(radio).val() == selected){
						$(radio).attr("checked","checked");
						console.log($(radio).val() + "checked");
						}
					else {
						$(radio).removeAttr("checked");
						}
				});
				$(obj).attr('data-orig-html', $(obj).html());
			}
		});
  
		initStarRating();
		initPreviewLink();
		initShadeHighlighter();
	  	//window.location.reload();*/
  	},
    //sortOnLoad: ['data-score-onload','asc']
  });
  
});

initStarRating = function() {
  $('.auto-submit-star').rating({
 		callback: function(value, link){
 		$(this).parents(".star-form").attr("data-selected",value);
			$.ajax({
				url: this.form.action,
				data: "value=" + value,
				dataType: "json",
				success: function(data) {
					$(".designs [data-id=" + data.id + "], .design").find(".design-score").text(Math.floor(data.score));
					$(".designs [data-id=" + data.id + "]").attr("data-score", data.score_sort);

					$(".designs [data-id=" + data.id + "], .design").find(".design-vote_count").text(data.vote_count);	
					if (data.vote_count != 1) $(".designs [data-id=" + data.id + "], .design").find(".plural").show();
					else $(".designs [data-id=" + data.id + "], .design").find(".plural").hide();

					$('#designs').mixitup('sort',['data-score','asc']);
				}
			});
		}
	});
}

//////// beautify file upload button

function initUploadButton() {
	btn = $("#imageupload_button");
	wrapper = $("<div></div>");
	//wrapper.attr("class", $("#imageupload_button").attr("class"));
	wrapper.css({ 'position' : 'relative', 'cursor':'pointer', 'height' : btn.outerHeight(), 'width' : '100%' /*btn.outerWidth()*/ });
	wrapper.attr("id","imageupload_button_wrapper");
	btn.wrap(wrapper);
	console.log("cloned");
	btn_clone = $("<div>"+btn.attr("value")+"</div>").insertAfter(btn);
	btn_clone.attr("class", $("#imageupload_button").attr("class"));
	btn.css({
				'cursor':'pointer',
				'position':'absolute',
				'top':'0',
				'right':'0',
				'z-index':'99',
				'opacity':'0',
				'-moz-opacity':'0',
				'filter':'progid:DXImageTransform.Microsoft.Alpha(opacity=0)'
			});
}