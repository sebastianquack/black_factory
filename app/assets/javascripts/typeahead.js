$(document).ready(function() {
  $('.typeahead-username').typeahead( {
  name: 'usernames', 
  local: [ "Anonym" ],
  prefetch: '/usernames.json'
  });
});
