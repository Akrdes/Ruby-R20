require 'dxopal'
include DXOpal


require_remote "display.rb"
#require_remote 'map.rb'
#require_remote 'player.rb'

Image.register(:background,'images/asa.png')
Image.register(:ukishima,'images/ukishima.png')
Image.register(:title,'images/title.png')
Image.register(:title_msg,'images/title_msg.png')
Image.register(:clear,'images/clear.png')
Image.register(:over,'images/over.png')

Image.register(:return,'images/returnt.png')
Image.register(:retry,'images/retry.png')
Image.register(:ohh,'images/ohh.jpg')


Window.load_resources do
  Window.width  = 600
  Window.height = 800

  game=Game.new
  game.run
end

