$(document).ready(function() {

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