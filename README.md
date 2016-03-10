<p class="jumbotron"> Boldmetrics is an application which tracks visits and events to and on your website.<br><br>
    Simply create an account with us here at Boldmetrics, register your website and then copy and paste the following code into your 'application.js' file.</p>


<pre><code> var blocmetrics = {};
blocmetrics.report = function(eventName) {
   


   var event = {event: { name: eventName }};

   var request = new XMLHttpRequest();
   request.open("POST", "http://localhost:3000/api/events", true);
   request.setRequestHeader('Content-Type', 'application/json');
   request.send(JSON.stringify(event));


}


blocmetrics.report("Website-Visits");</code></pre>
<br>
<p class="jumbotron"> If you would like to track other events on your website, such as when a certain button is clicked or hovered over, please edit and then copy and paste the following code into your application.js file</p>
<pre><code>$(document).ready(function(){
  $("#about-link").click(function(){
    blocmetrics.report("about-link-clicked");
    console.log("It was clicked!");
  });
});</code></pre>