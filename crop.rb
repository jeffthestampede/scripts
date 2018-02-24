require 'rubygems'
require 'rmagick'

Dir.glob('/Users/jkao/Desktop/Crop/*.JPG') do |item|

  img = Magick::Image::read(item).first

  img = img.crop!(500, 0, 3456, 3456)

  img = img.resize_to_fit!(84, 84)

  imgname = File.basename(item,File.extname(item))

  puts imgname

  img.write("ID-#{imgname}.JPG")

end