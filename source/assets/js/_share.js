/**
 * Lightbox partial
 *
 * Opens the lightbox
 */

g.share = function() {
  var self = g.share;

  self.selectors = {
    twitterButton: "[data-js='share-on-twitter']"
  }
  self.classes = {
    success: "btn--twitter-shared"
  }
  self.variables = {
    success: "Thanks!"
  }
  
};