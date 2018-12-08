require 'dxopal'
include DXOpal

Image.register(:background, 'images/asa.png')
Window.load_resources do
  Window.width  = 800
  Window.height = 600
  background_img = Image[:background]
  background_img.set_color_key([0, 0, 0])
  
  Window.loop do
  end
end