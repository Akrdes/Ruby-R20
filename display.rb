# coding: utf-8
class Display < Sprite
def title
      # タイトル画面
      Window.draw_font(0, 30, "PRESS SPACE", Font.default)
      # スペースキーが押されたらシーンを変える
      if Input.key_push?(K_SPACE)
        GAME_INFO[:scene] = :playing

end

def playing
      # ゲーム中
      player.update
      items.update(player)

      player.draw
      items.draw

end

def resalt
Window.draw_font(0, 30, "PRESS SPACE", Font.default)
      player.draw
      items.draw
      # スペースキーが押されたらゲームの状態をリセットし、シーンを変える
      if Input.key_push?(K_SPACE)
        player = Player.new
        items = Items.new
        GAME_INFO[:score] = 0
        GAME_INFO[:scene] = :playing
      end
end

