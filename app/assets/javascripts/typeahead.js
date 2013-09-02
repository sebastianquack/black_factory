var usernames;

$(window).load(function() {
  
   $.getJSON("/usernames.json", null, function (data) {
		usernames = data;
  });
  
  $('.typeahead-username').on("keyup focus", function (a,b) {
  	if ( $.inArray( $(this).val(), usernames ) < 0) {
  		$('.typeahead-username-new').show();
  		$('.typeahead-username-old').hide();
  	}
  	else {
  		$('.typeahead-username-new').hide();
  		$('.typeahead-username-old').show();
  	}
  });
  
});

