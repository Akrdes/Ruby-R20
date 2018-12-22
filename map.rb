# coding: utf-8

class Map < Sprite

end

class Uki < Sprite
    def initialize(x,y,image,height)
        @s_x = x
        @s_y = y
        @height = height
        super
    end

    def h
        return @height
    end
    
    def init
        self.x = @s_x
        self.y = @s_y
    end

    def hit
        $score += 100
        if($player.y < (self.y - 10))
            if($player.vy > 0)
                $player.f_false
                $player.vy = 0
            end

            shift_y = 761 - self.y
            $player.y = self.y - $player.h + shift_y
            $ukis.each do |uki|
                uki.y += shift_y
            end
            $map.y += shift_y
        elsif($player.y > (self.y + self.h))
            $player.x = self.x
        end

    end
end