# coding: utf-8

class Map < Sprite

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