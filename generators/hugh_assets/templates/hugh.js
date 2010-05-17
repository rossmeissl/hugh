var Hugh = Class.create({
    initialize: function(el) {
      this.el = $(el);
      this.track = new Element('div', { 'class': 'hugh hugh-track' });
      this.handle = new Element('div', { 'class': 'hugh hugh-handle' });
      this.track.insert({ bottom: this.handle });
      this.el.insert({ after: this.track });
    }
});
