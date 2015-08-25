/**
 * Lightbox partial
 *
 * Opens the lightbox
 */

g.sounds = function() {
  var self = g.sounds;

  self.selectors = {
    twitterButton: "[data-js='share-on-twitter']"
  }
  self.datas = {
    sound: 'data-sound'
  }
  $('audio').on('play', function() {
    console.log('playing');
    var that = $(this);
    $('audio').each(function() {
      if (that.attr(self.datas.sound) != $(this).attr(self.datas.sound)) {
        var sound = $(this)[0];
        sound.pause();
        sound.currentTime = 0;
      }
    });
  });
  
};