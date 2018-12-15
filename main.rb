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

  $map = Map.new(0,-1000,background_img)
  
  $ukis = []
  $ukis << Uki.new(235,761,Image[:ukishima])
  $ukis << Uki.new(430,700,Image[:ukishima])
  $ukis << Uki.new(280,580,Image[:ukishima])
  $ukis << Uki.new(150,500,Image[:ukishima])
  $ukis << Uki.new(270,400,Image[:ukishima])
  $ukis << Uki.new(400,300,Image[:ukishima])
  $ukis << Uki.new(200,180,Image[:ukishima])
  $ukis << Uki.new(50,80,Image[:ukishima])

  count = 1
  
  Window.loop do
    #Window.draw(0,-1000,background_img)
    #Window.draw(300,200,ukishima_img)
    $map.draw
    if Input.key_push?(K_SPACE)
      $ukis[count].hit

      count += 1
    end
    
    $ukis.each do |uki|
      uki.draw
    end
    
  end
end