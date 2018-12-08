# coding: utf-8

class Player < Sprite
  attr_accessor :v,:bottom

  def initialize(x,y,image)
    @v = 0
    @bottom = y + 32 # 32x32の画像の場合
    super
  end
  
  def jump
    @v = -20 if(Input.key_push?(K_SPACE))
    @bottom += @v
    if(@bottom >= 321)
      @bottom = 320
      @v = 0
    end
    self.y = @bottom - 32
    @v += 1 # 重力加速度
  end
  
end