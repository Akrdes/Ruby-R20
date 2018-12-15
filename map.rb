# coding: utf-8

class Map < Sprite
#  def initialize
#    @@ukis = []
#    @@ukis << Uki.new(235,761,Image[:ukishima])
#    @@ukis << Uki.new(430,700,Image[:ukishima])
#    @@ukis << Uki.new(280,580,Image[:ukishima])
#    @@ukis << Uki.new(150,500,Image[:ukishima])
#    @@ukis << Uki.new(270,400,Image[:ukishima])
#    @@ukis << Uki.new(400,300,Image[:ukishima])
#    @@ukis << Uki.new(200,180,Image[:ukishima])
#    @@ukis << Uki.new(50,80,Image[:ukishima])
#  end
#  
#  def draw
#    @@ukis.each do |uki|  
#      uki.draw
#    end 
#  end
#  
#  def update 
#    @@ukis.each do |uki|
#      uki.collision(uki.x,uki.y,uki.x+130,uki.y+39)
#    end
#  end
  
#  def hit
#    @ukis.each do |uki|
#      uki.y += 761 - uki.y
#    end
#  end
end

class Uki < Sprite
  def hit
    shift_y = 761 - self.y
    $ukis.each do |uki|
      uki.y += shift_y
    end
    $map.y += shift_y
  end
end