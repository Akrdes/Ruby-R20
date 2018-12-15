# coding: utf-8
require "dxopal"
include DXOpal


# ゲーム本体を表すクラス
class Game
  GAME_INFO = {
  scene: :home,  # 現在のシーン(起動直後は:home)
  score: 0,
}
  def initialize
    reset
  end

  # ゲームの状態をリセットする
  def reset
   # @player = Player.new
   # @map = Map.new
    GAME_INFO[:score] = 0
    GAME_INFO[:status]= 0
  end

  # ゲームを実行する
  def run
    Window.loop do
    
      case GAME_INFO[:scene]
      
      when :home
       Window.draw(0, -1000,Image[:background])
       Window.draw_scale(-80,200,Image[:title],0.7,0.7)
       Window.draw_scale(-410,400,Image[:title_msg],0.4,0.4)
        if Input.key_push?(K_ENTER)
          GAME_INFO[:scene] = :playing
        end
        
      when :playing
      Window.draw_font(600, 0, "SCORE: #{GAME_INFO[:score]}",Font.default)
      Window.draw_font(200, 0, "Game play", Font.default)
      #  @player.update
       # @map.update

       # @player.draw
       # @map.draw
      
      
        
      #ゲームクリア
      if Input.key_push?(K_A)
          GAME_INFO[:scene] = :resultclear
    　#ゲームオーバー
      elsif Input.key_push?(K_S)
          GAME_INFO[:scene] = :resultover
      end  
      
        
      when :resultclear
      Window.draw_scale(-80,600,Image[:clear],0.7,0.7)
        if Input.key_push?(K_SPACE)
          reset
          GAME_INFO[:scene] = :playing
        end
      
      when :resultover
      Window.draw_scale(-80,200,Image[:over],0.7,0.7)
        if Input.key_push?(K_SPACE)
          reset
          GAME_INFO[:scene] = :playing
        end
      
        
      end
    end
  end
end

