# coding: utf-8
require "dxopal"
include DXOpal

GAME_INFO = {
  scene: :title,  # 現在のシーン(起動直後は:title)
  score: 0,
}
# ゲーム本体を表すクラス
class Game
  def initialize
    reset
  end

  # ゲームの状態をリセットする
  def reset
    @player = Player.new
    @map = Map.new
    GAME_INFO[:score] = 0
  end

  # ゲームを実行する
  def run
    Window.loop do
      Window.draw_box_fill(0, 0, Window.width, GROUND_Y, [128, 255, 255])
      Window.draw_box_fill(0, GROUND_Y, Window.width, Window.height, [0, 128, 0])
      Window.draw_font(0, 0, "SCORE: #{GAME_INFO[:score]}", Font.default)

      case GAME_INFO[:scene]
      when :title
        Window.draw_font(0, 30, "PRESS SPACE", Font.default)
        if Input.key_push?(K_SPACE)
          GAME_INFO[:scene] = :playing
        end
      when :playing
      #  @player.update
       # @map.update

       # @player.draw
       # @map.draw
     if Input.key_push?(K_SPACE)
          GAME_INFO[:scene] = :playing
        end
      when :result
        Window.draw_font(0, 30, "PRESS SPACE", Font.default)
        if Input.key_push?(K_SPACE)
          reset
          GAME_INFO[:scene] = :playing
        end
      end
    end
  end
end

