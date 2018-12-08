require 'dxopal'
include DXOpal

Image.register(:background, 'images/asa.png')
Window.load_resources do
  Window.width  = 800
  Window.height = 600
  background_img = Image[:background]
  Window.loop do
  end
end
