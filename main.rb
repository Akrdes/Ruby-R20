require 'dxopal'
include DXOpal

require_remote 'map.rb'
require_remote 'display.rb'
require_remote 'player.rb'

Image.register(:background,'images/asa.png')
Image.register(:ukishima,'images/ukishima.png')
Image.register(:title,'images/title.png')
Image.register(:title_msg,'images/title_msg.png')
Image.register(:clear,'images/clear.png')
Image.register(:over,'images/over.png')

Image.register(:return,'images/returnt.png')
Image.register(:retry,'images/retry.png')
Image.register(:ohh,'images/ohh.jpg')
Image.register(:player, 'images/bobu.png')
GROUND_Y = 761

Window.load_resources do
  Window.width  = 600
  Window.height = 800
  background_img = Image[:background]
  background_img.set_color_key([0, 0, 0])
  ukishima_img = Image[:ukishima]
  ukishima_img.set_color_key([255, 255, 255])
  
  $score = 0

  $map = Map.new(0,-2500,background_img)
  
  $ukis = []
  $ukis << Uki.new(235,761,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(430,700,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(280,580,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(150,500,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(270,400,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(400,300,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(200,180,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(50,80,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(150,-20,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(300,-130,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(430,-239,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(320,-370,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(170,-520,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(10,-620,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(120,-730,Image[:ukishima],Image[:ukishima].height)
  $ukis << Uki.new(250,-850,Image[:ukishima],Image[:ukishima].height)

  $player = Player.new(270, GROUND_Y-Image[:player].height, Image[:player], Image[:player].height)

  game=Game.new

  game.run
end
