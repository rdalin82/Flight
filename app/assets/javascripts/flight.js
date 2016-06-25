$(document).ready(function(){
  $(".dropdown li a").click(function(){
    $(this).parents(".dropdown").find('.selection').text($(this).text());
    $(this).parents(".dropdown").find('.selection').val($(this).text());
  });
  $('#datepicker').datepicker({dateFormat: "yy-mm-dd"});
  $('#reset').on("click", function(){
    window.location.reload();
  })
});
var main = new Vue({
    el: "#app",
    data: { 
      title: "Flight picker",
      airports: [], 
      arrivalAirports: ["select a departure first"],
      results: [], 
      searchCity: "",
      depart: undefined,
      arrival: undefined
    },
    methods: {
      getData: function(){
      }, 
      setDepart: function(newValue){
        this.results = [];
        this.depart = newValue.name;
        this.getArrivalAirports(this.depart);
      }, 
      setArrival: function(newValue){
        this.results = [];
        this.arrival = newValue.name;
      }, 
      match: function(item){
        search = main.searchCity.toUpperCase();
        it = item.name.toUpperCase();
        return it.includes(search);
      },
      getFlights: function(arrival, depart){
        main.results = [];
        $.getJSON("/flights.json?depart="+this.depart+"&arrive="+this.arrival, function(response){
          $.each(response, function(key, value){
            flight = {}
            flight.id = value.id;
            flight.duration = value.duration;
            main.results.$set(key, flight);
            // console.log(value);
          })
        })
        .done(function(response){
          // console.log("success with flights");
        })
        .fail(function(){
          console.log("failure with flights");
        })
        .always(function(){
          // console.log("done with flights");
        })
      },
      getArrivalAirports: function(airport){
        main.arrivalAirports = [];
        $.getJSON("/airport.json?depart="+airport, function(response){
          $.each(response, function(key, value){
            main.arrivalAirports.$set(key, value);
          })
        })
        .done(function(response){

          // console.log("success with arrival flights");
        })
        .fail(function(){
          console.log("failure arrival flights");
        })
        .always(function(){
          // console.log("All done arrival flights");
        })
      }
    },
    ready: function(){
      $.getJSON("/airport.json", function(response){
        $.each(response, function(key, value){
          main.airports.$set(key, value);
        })
       })
        .done(function(response){
          var first = {
            name: "Departure Flight"
          }
          main.airports.unshift(first);
        // console.log(main.airports.length)
        // console.log("success");
      })
      .fail(function(){
      console.log("failure");
      })
      .always(function(){
      // console.log("complete");
    });
  }
})

