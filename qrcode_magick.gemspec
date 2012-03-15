# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qrcode_magick/version"

Gem::Specification.new do |s|
  s.name        = "qrcode_magick"
  s.version     = QrcodeMagick::VERSION
  s.authors     = ["Terry Finn"]
  s.email       = ["terry@terryrfinn.com"]
  s.homepage    = "https://github.com/terryfinn/qrcode_magick"
  s.summary     = %q{Makes generating QRCodes simple}
  s.description = %q{Makes it easy to generate QRCodes using rQRCode for encoding and RMagick for rendering}

  s.rubyforge_project = "qrcode_magick"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rqrcode'
  s.add_dependency 'rmagick'
end
