console.log("Hello from the JavaScript console!");

// Your AJAX request here

$.ajax({
  url: "http://api.openweathermap.org/data/2.5/weather" +
    '?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
  type: "GET",
  success(data) {
    console.log("Here is your requested weather forecast:");
    console.log(data);
  },
  error(){
    console.error('Could not find requested forecast!');
  }
});


// Add another console log here, outside your AJAX request

console.log("Outside of AJAX request")
