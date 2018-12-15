require 'dxopal'
include DXOpal

#require_remote 'map.rb'

Image.register(:background, 'images/asa.png')
Image.register(:ukishima,'images/ukishima.png')
Window.load_resources do
  Window.width  = 800
  Window.height = 600
  background_img = Image[:background]
  background_img.set_color_key([0, 0, 0])
  ukishima_img = Image[:ukishima]
  ukishima_img.set_color_key([255, 255, 255])

  Window.loop do
    Window.draw(0,-1200,background_img)
    Window.draw(500,200,ukishima_img)
    
  end
end