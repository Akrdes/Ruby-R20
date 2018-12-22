# coding: utf-8
require "dxopal"
require "dxruby"
include DXOpal

require_remote 'map.rb'
require_remote 'player.rb'

# ゲーム本体を表すクラス
class Game
  GAME_INFO = {
  scene: :home,  # 現在のシーン(起動直後は:home)
}
  def initialize
    reset
  end

  # ゲームの状態をリセットする
  def reset
    $score = 0
    $player.x  = 270
    $player.y = 761 - $player.h
    $player.jflag = false
    $player.vy = 0
    $map.y = -1600
    $ukis.each do |uki|
      uki.init
    end

    GAME_INFO[:status]= 0
  end

  # ゲームを実行する
  def run
    Window.loop do
    
      case GAME_INFO[:scene]
      
      when :home
       Window.draw(0, -1600,Image[:background])
       Window.draw_scale(-80,200,Image[:title],0.7,0.7)
       Window.draw_scale(-410,400,Image[:title_msg],0.4,0.4)
        if Input.key_push?(K_ENTER)
          GAME_INFO[:scene] = :playing
        end
        
      when :playing
        
        $player.update
        Sprite.check($player,$ukis)
        $map.draw
        $player.draw
        $ukis.each do |uki|
            uki.draw
        end
        Window.draw_font(600, 0, "SCORE: #{GAME_INFO[:score]}",Font.default)
      
      #ゲームクリア
      if($player.y == $ukis[16].y - $player.h)
        GAME_INFO[:scene] = :resultclear
      #ゲームオーバー
      elsif($player.y > 800)
        GAME_INFO[:scene] = :resultover
      end
      if Input.key_push?(K_G)
          reset
          GAME_INFO[:scene] = :resultclear
      end
        
      when :resultclear
        Window.draw(0, -1600,Image[:background])
        Window.draw_scale(-190,100,Image[:clear],0.6,0.6)
        Window.draw_font(230,300,"SCORE: #{$score}",Font.default)
        Window.draw_scale(-140,400,Image[:return],0.65,0.65)

        if Input.key_push?(K_ENTER)
          reset
          GAME_INFO[:scene] = :home
        end

      when :resultover
        Window.draw_scale(-160,100,Image[:over],0.6,0.6)
        Window.draw_scale(-115,250,Image[:retry],0.7,0.7)
        Window.draw_scale(160,550,Image[:ohh],2.3,2.3)
        if Input.key_push?(K_ENTER)
          reset
          GAME_INFO[:scene] = :playing
        end

        if Input.key_push?(K_G)
          reset
          GAME_INFO[:scene] = :resultclear
        end
      end
    end
  end
end

