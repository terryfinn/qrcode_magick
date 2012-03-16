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
  }
  
  def self.draw(string, *args)
    self.parse_options(args)
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
end
