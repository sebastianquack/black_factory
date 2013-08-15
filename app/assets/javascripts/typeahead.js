var usernames;

grabUsernames = function(parsedResponse) {
	usernames = parsedResponse;
	return parsedResponse;
}

$(document).ready(function() {
  $('.typeahead-username').typeahead( {
	  name: 'usernames', 
	  local: [ "Anonym" ],
	  prefetch: { url: '/usernames.json', ttl: 60, filter: grabUsernames }
  });
  
  $('.typeahead-username').on("keyup focus", function (a,b) {
  	if ( $.inArray( $(this).val(), usernames ) ) {
  		$('.typeahead-username-new').show();
  		$('.typeahead-username-old').hide();
  	}
  	else {
  		$('.typeahead-username-new').hide();
  		$('.typeahead-username-old').show();
  	}
  });
  
  
  $('.typeahead-username').on("typeahead:opened", function () { 
    var additionalStyles = " font-family: 'La Belle Aurore', cursive; font-size:25px; color:#ccc; left:-2px; top:-2px;"
    var hint_tag = $(".tt-hint");
    hint_tag.attr("style", hint_tag.attr("style") + additionalStyles);
  });
  
});

