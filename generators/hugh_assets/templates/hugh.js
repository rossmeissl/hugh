var foo;
var Hugh = Class.create({
    initialize: function(el) {
      this.el = $(el);
      this.track = new Element('div', { 'class': 'hugh hugh-track' });
      this.handle = new Element('div', { 'class': 'hugh hugh-handle' });
      this.track.insert({ bottom: this.handle });
      this.el.insert({ after: this.track });
      this.numFromHex = function(hex) {
        red = parseInt(hex.substr(0, 2), 16);
        green = parseInt(hex.substr(2, 2), 16);
        blue = parseInt(hex.substr(4, 2), 16);
        if (red == 255 && green == 0) return blue;
        else if (green == 0 && blue == 255) return 256 + 255 - red;
        else if (red == 0 && blue == 255) return 512 + green;
        else if (red == 0 && green == 255) return 768 + 255 - blue;
        else if (green == 255 && blue == 0) return 1024 + red;
        else if (red == 255 && blue == 0) return 1280 + 255 - green;
      }
      this.slider = new Control.Slider(this.handle, this.track, {
        hugh: this,
        range: $R(0, 1535),
        sliderValue: this.numFromHex($F(this.el)),
        onChange: function(num, slider) {
          if (num < 256) {
            red = 255;
            green = 0;
            blue = num.round() % 256;
          }
          else if (num < 512) {
            red = 255 - (num.round() % 256);
            green = 0;
            blue = 255;
          }
          else if (num < 768) {
            red = 0;
            green = num.round() % 256;
            blue = 255;
          }
          else if (num < 1024) {
            red = 0;
            green = 255;
            blue = 255 - (num.round() % 256);
          }
          else if (num < 1280) {
            red = num.round() % 256;
            green = 255;
            blue = 0;
          }
          else if (num < 1536) {
            red = 255;
            green = 255 - (num.round() % 256);
            blue = 0;
          }
          slider.options.hugh.rgb = [red, green, blue];
          slider.options.hugh.hex = slider.options.hugh.colorToHex(red, green, blue);
          slider.options.hugh.el.value = slider.options.hugh.hex;
        }
      });
      this.colorToHex = function(red, green, blue) {
        return red.toColorPart() + green.toColorPart() + blue.toColorPart();
      };
    }
});
