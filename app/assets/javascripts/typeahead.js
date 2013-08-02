$(document).ready(function() {
  $('.typeahead-username').typeahead( {
	  name: 'usernames', 
	  local: [ "Anonym" ],
	  prefetch: { url: '/usernames.json', ttl: 60 }
  });
  
  
  $('.typeahead-username').on("typeahead:opened", function () { 
    var additionalStyles = " font-family: 'La Belle Aurore', cursive; font-size:25px; color:#ccc; left:-2px; top:-2px;"
    var hint_tag = $(".tt-hint");
    hint_tag.attr("style", hint_tag.attr("style") + additionalStyles);
  });
  
});
