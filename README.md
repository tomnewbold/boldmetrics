var blocmetrics = {};
blocmetrics.report = function(eventName) {
   

  console.log("This function was, infact, actually called.")

   var event = {event: { name: eventName }};

   var request = new XMLHttpRequest();
   request.open("POST", "http://localhost:3000/api/events", true);
   request.setRequestHeader('Content-Type', 'application/json');
   request.send(JSON.stringify(event));


}


blocmetrics.report("PageLoaded");


$(document).ready(function(){
  $("#about-link").click(function(){
    blocmetrics.report("about-link-clicked");
    console.log("It was clicked!");
  });
});