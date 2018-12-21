require 'dxopal'
include DXOpal

require_remote 'map.rb'
require_remote 'player.rb'

Image.register(:background, 'images/asa.png')
Image.register(:ukishima,'images/ukishima.png')
Image.register(:player, 'images/player.png')

Window.load_resources do
  Window.width  = 600
  Window.height = 800
  background_img = Image[:background]
  background_img.set_color_key([0, 0, 0])
  ukishima_img = Image[:ukishima]
  ukishima_img.set_color_key([255, 255, 255])

  $map = Map.new(0,-1000,background_img)
  player = Player.new(Window.width/2, Window.height-(Image[:ukishima].height-15+Image[:player].height), Image[:player])
  
  $ukis = []
  $ukis << Uki.new(235,761,Image[:ukishima])
  $ukis << Uki.new(430,680,Image[:ukishima])
  $ukis << Uki.new(260,570,Image[:ukishima])
  $ukis << Uki.new(90,480,Image[:ukishima])
  $ukis << Uki.new(270,390,Image[:ukishima])
  $ukis << Uki.new(400,280,Image[:ukishima])
  $ukis << Uki.new(210,160,Image[:ukishima])
  $ukis << Uki.new(40,80,Image[:ukishima])
  $ukis << Uki.new(200,-40,Image[:ukishima])
  $ukis << Uki.new(430,-140,Image[:ukishima])
  $ukis << Uki.new(260,-260,Image[:ukishima])
  #$ukis << Uki.new(320,-400,Image[:ukishima])
  #$ukis << Uki.new(170,-520,Image[:ukishima])
  #$ukis << Uki.new(10,-620,Image[:ukishima])
  #$ukis << Uki.new(120,-730,Image[:ukishima])
  #$ukis << Uki.new(250,-850,Image[:ukishima])
  
  $count = 1
  
  Window.loop do
    #Window.draw(0,-1000,background_img)
    #Window.draw(300,200,ukishima_img)
    $map.draw
    $ukis[$count].collision = [$ukis[$count].x, $ukis[$count].y+5, $ukis[$count].x+(1.8*Image[:ukishima].width), $ukis[$count].y+10]
    player.collision = [player.x, player.y+1, player.x+Image[:player].width, player.y]
    player.update($ukis[$count])
    $ukis.each do |uki|
      uki.draw
    end
    player.draw
  end
end