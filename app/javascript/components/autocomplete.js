function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var recordAddress = document.getElementById('record_address');

    if (recordAddress) {
      var autocomplete = new google.maps.places.Autocomplete(recordAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(recordAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
