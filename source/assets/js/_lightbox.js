/**
 * Lightbox partial
 *
 * Opens the lightbox
 */

g.lightbox = function() {
  var self = g.lightbox;

  self.selectors = {
    trigger: "[data-js='open-lightbox']",
    close: "[data-js='close-lightbox']",
    item: "[data-js='close-lightbox']",
    image: "[data-js='change-lightbox-image']"
  }
  self.classes = {
    open: "lightbox--open"
  }

  // Open lightbox
  $(self.selectors.trigger).on('click', function(e) {
    e.preventDefault();
    var image = $(this).attr('href');
    $(self.selectors.image).css('background-image', 'url(' + image + ')');
    $(self.selectors.item).addClass(self.classes.open);
  });

  // Close lightbox
  $(self.selectors.close).on('click', function(e) {
    e.preventDefault();
    $(self.selectors.item).removeClass(self.classes.open);
  });

};