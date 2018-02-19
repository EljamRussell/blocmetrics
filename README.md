This app was created as part of the blocmetrics Software Engineering Track called Blocmetrics. It is an analytics service to track events on websites.

Blocmetrics now allows users to create an account, verify their email, and add web apps to track.

A client-side JavaScript snippet that allows a user to track events on their website.
A server-side API that captures and saves those events to a database.
A Rails application that displays the captured event data for a user.

This is the JavaScript snippet developers can put in their app to track events. In Rails, a good place to put it is app/assets/javascripts/application.js:

var blocmetrics = {};
  blocmetrics.report = function(eventName){
  var event = {event: { name: eventName }};
  var request = new XMLHttpRequest();
  request.open("POST", "http://localhost:3000/api/events", true); request.setRequestHeader('Content-Type', 'application/json'); request.send(JSON.stringify(event)); };
