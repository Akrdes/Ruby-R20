require 'dxopal'
include DXOpal

require_remote "display.rb"


Image.register(:background, '')
Window.load_resources do
  Window.width  = 800
  Window.height = 600
  
#  background_img = Image[:background]
#  background_img.set_color_key([0, 0, 0])
  
 
end
