# QRCode Magick

QRCodeMagick is an easy to use gem that makes generating QRCodes and rendering them to images super simple.

## Usage

QRCodeMagick is very simple to use.  There are two basic methods: `draw` and `draw_image`.  Below is an example script that show how both methods work.

```ruby
require 'rubygems'
require 'qrcode_magick'

# Generate a RMagick drawing for a qrcode
drawing = QRCodeMagick.draw 'some url'

# Generate a RMagick drawing for a qrcode with some options
drawing_with_options = QRCodeMagick.draw 'some url', :scale => 8

# Generate a RMagick image for a qrcode
image = QRCodeMagick.draw_image 'some url'

# Generate a QRCode and write it to disk
image = QRCodeMagick.draw_image 'some url', :scale => 8, :write_to => 'qrcode.png'
```
