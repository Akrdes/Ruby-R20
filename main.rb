require "dxopal"
include DXOpal
require_remote 'player.rb'

GROUND_Y = 400
# 使いたい画像を宣言する
Image.register(:player, 'player.png')

Window.load_resources do
  player = Player.new(Window.width/2, GROUND_Y-Image[:player].height, Image[:player])
  Window.loop do
    player.update
    Window.draw_box_fill(0, 0, Window.width, GROUND_Y, [128, 255, 255])
    Window.draw_box_fill(0, GROUND_Y, Window.width, Window.height, [0, 128, 0])
    # プレイヤーキャラを描画
    player.draw
  end
end