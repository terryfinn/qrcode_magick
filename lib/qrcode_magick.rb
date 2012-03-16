require 'qrcode_magick/version'
require 'rqrcode'
require 'RMagick'

module QRCodeMagick
  OPTS = {
    :size => 4,
    :level => :h,
    :scale => 1,
    :write_to => nil,
    :drawing => Magick::Draw.new,
    :canvas => nil
    :fill => Magick::HatchFill.new('white')
  }
  
  def self.draw(string, *args)
    self.parse_options(args)
    qrcode = RQRCode::QRCode.new(string, :size => OPTS[:size], :level => OPTS[:level])
    OPTS[:drawing] = self.generate_drawing(qrcode, OPTS[:drawing], OPTS[:scale])
    OPTS[:canvas] = self.generate_canvas(qrcode, OPTS[:scale], OPTS[:fill]) unless OPTS[:canvas]
  end
  
  private
  
  def self.parse_options(args)
    if hash = args.first
      Hash[hash].each do |k,v|
        raise ArgumentError, "unknow option: #{k}" unless OPTS.key?(k)
        OPTS[k] = v
      end
    end
  end
  
  def self.generate_canvas(qrcode, scale, fill)
    canvas_side = (qrcode.module_count * scale) + (2 * scale)
    Magick::Image.new(canvas_side, canvas_side, fill)
  end
  
  def self.generate_drawing(qrcode, drawing, scale)
    offset = scale - 1
    
    qrcode.module_count.times do |row|
      y = (row * scale) + scale
      qrcode.module_count.times do |column|
        x = (column * scale) + scale
        drawing.rectangle(x, y, (x + offset), (y + offset)) if qrcode.is_dark(row, column)
      end
    end
    
    drawing
  end
end
