require 'dxopal'
include DXOpal

require_remote 'map.rb'

Image.register(:background, 'images/asa.png')
Image.register(:ukishima,'images/ukishima.png')
Window.load_resources do
  Window.width  = 600
  Window.height = 800
  background_img = Image[:background]
  background_img.set_color_key([0, 0, 0])
  ukishima_img = Image[:ukishima]
  ukishima_img.set_color_key([255, 255, 255])

  map = Map.new()
  
  Window.loop do
    Window.draw(0,-1000,background_img)
    #Window.draw(300,200,ukishima_img)
    map.draw
  end
end