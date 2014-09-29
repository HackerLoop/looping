(function($){
  $.getQuery = function( query ) {
    query = query.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var expr = "[\\?&]"+query+"=([^&#]*)";
    var regex = new RegExp( expr );
    var results = regex.exec( window.location.href );
    if( results !== null ) {
      return results[1];
      return decodeURIComponent(results[1].replace(/\+/g, " "));
    } else {
      return undefined;
    }
  };
})(jQuery);
