// include spec/javascripts/helpers/spec_helper.js and app/assets/javascripts/foo.js
//= require helpers/spec_helper
//= require movies


describe('movie list', function() {

  var requestList = function(client) {
    return movieList.requestList(client);
  }

  var drawMovieList = function(client, widget) {
    return movieList.drawMovies(widget, client);
  };

  it("requests a list of movies from the client", function() {
    var client = { retrieveMovies: function(){} };
    spyOn(client, "retrieveMovies");

    requestList(client);

    expect(client.retrieveMovies).toHaveBeenCalled();
  });

  it("receives a list of movies from the client", function() {
    var falseData = [{id: 1, name: "patata 7"}];
    var client = { retrieveMovies: function(callback){
      callback(falseData);
    } };
    var widget = { draw: function(){}};
    spyOn(widget, "draw");

    drawMovieList(client, widget);

    expect(widget.draw).toHaveBeenCalled();
  });
});