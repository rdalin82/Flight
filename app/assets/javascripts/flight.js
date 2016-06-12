$(document).ready(function(){

  $(".dropdown li a").click(function(){
    $(this).parents(".dropdown").find('.selection').text($(this).text());
    $(this).parents(".dropdown").find('.selection').val($(this).text());
  });
});

var main = new Vue({
    el: "#app",
    data: { 
      title: "Flight picker",
      airports: [], 
      arrivalAirports: ["select a departure first"],
      results: [], 
      depart: undefined,
      arrival: undefined
    },
    methods: {
      getData: function(){
      }, 
      setDepart: function(newValue){
        this.depart = newValue.name;
        this.getArrivalAirports(this.depart);
      }, 
      setArrival: function(newValue){
        this.arrival = newValue.name;
      }, 
      getFlights: function(arrival, depart){
        main.results = [];
        $.getJSON("/flights.json?depart="+this.depart+"&arrive="+this.arrival, function(response){
          $.each(response, function(key, value){
            flight = {}
            // flight.depart = value.from_airport;
            // flight.arrive = value.to_airport;
            flight.duration = value.duration;
            main.results.push(flight);
            console.log(value);
          })
        })
        .done(function(response){
          console.log("success with flights");
        })
        .fail(function(){
          console.log("failure with flights");
        })
        .always(function(){
          console.log("done with flights");
        })
      },
      getArrivalAirports: function(airport){
        main.arrivalAirports = [];
        $.getJSON("/airport.json?depart="+airport, function(response){
          $.each(response, function(key, value){
            console.log(value.name);
            main.arrivalAirports.push(value);
          })
        })
        .done(function(response){

          console.log("success with arrival flights");
        })
        .fail(function(){
          console.log("failure arrival flights");
        })
        .always(function(){
          console.log("All done arrival flights");
        })
      }
    },
    ready: function(){
      $.getJSON("/airport.json", function(response){
        $.each(response, function(key, value){
          main.airports.push(value);
        })
       })
        .done(function(response){
        console.log(main.airports.length)
        console.log("success");
      })
      .fail(function(){
      console.log("failure");
      })
      .always(function(){
      console.log("complete");
    });
  }
})

