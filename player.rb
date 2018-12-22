# coding: utf-8

class Player < Sprite
        attr_accessor :x1,:y1,:move,:jflag,:vy,:vy0,:g,:height
  
    def initialize(x,y,image,height)
      @x1 = x * 2
      @y1 = y
      @move = 4.0
      @jflag = false
      @vy = 0
      @vy0 = -18.0
      @g = 0.5
      @height = height
      super
    end

    def h
        return @height
    end

    def f 
        return @jflag
    end

    def f_false
        @jflag = false
    end
    
    def update
      if (Input.key_down?(K_RIGHT) && self.x < self.x1-self.image.width ) # →キーを押したか
          self.x += self.move;
      end
      if (Input.key_down?(K_LEFT) && self.x > 0 ) #←キーを押したか
          self.x -= self.move;
      end
      
      if (self.jflag)
          self.y += self.vy;
          if ( self.vy == self.vy0 * (-1.0) )
              self.jflag = false;
          end
          self.vy += self.g;
      else 
          if (Input.key_down?(K_SPACE))
              self.jflag = true;
              self.vy = self.vy0;
          end
      end
      self.y += 6
    end
    
    def c(island)
      self.y  = island.y - self.height
    end 
  end