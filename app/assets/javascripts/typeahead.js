$(document).ready(function() {
  $('.typeahead-username').typeahead( {
  name: 'usernames', 
  local: [ "Anonym" ],
  prefetch: { url: '/usernames.json', ttl: 60 }
  });
});
