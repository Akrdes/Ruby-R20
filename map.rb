# coding: utf-8

class Map < Sprite
  def draw
    uki = []
    uki<<Uki.new(50,500)      
    uki<<Uki.new(10,90)
    
    for i in uki  
        Window.draw(i.x,i.y,Image[:ukishima])
    end
       
  end
end

class Uki
  attr_accessor :x,:y
  def initialize(x,y)
    @x = x
    @y = y
  end
end