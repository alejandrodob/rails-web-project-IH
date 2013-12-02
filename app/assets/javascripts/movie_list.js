var movieList = function() {
  self = {};

  self.requestList = function(client) {
    var movies = client.retrieveMovies();
    return movies;
  };

  self.drawMovies = function(widget, client) {
    var movies = self.requestList(client);
    widget.draw(movies);
  };

  return self;
}();

















































// function movieList(client, widget) {

//   var self = {};

//   self.showMovies = function() {
//     client.retrieveMovies(drawMovies);
//   };

//   drawMovies = function(movies) {
//     widget.draw(movies);
//   }

//   return self;
// }




// function movieClient() {

//   var self = {};

//   self.retrieveMovies = function(callback) {
//     $.get("movies", function(data){
//       callback(data);
//     });
//   };

//   return self;
// }

// function widget() {

//   var self = {};

//   self.draw = function(movies) {
//     $select=$("movies");

//     //lo que ponia esta mañana en la consola...
//   }

//   return self;
// }


// // un "main" que ejecute lo demás

// $(document).ready(function(){
//   var list = movieList(client(), widget());
// });