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
      depart: undefined;
      arrival: undefined;
    },
    methods: {
      getData: function(){
      }
    },
    ready: function(){
      $.getJSON("/airport.json", function(response){
        $.each(response, function(key, value){
          main.airports.push(value.name);
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

