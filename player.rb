# coding: utf-8

class Player < Sprite
  attr_accessor :x1,:y1,:move,:jflag,:vy,:vy0,:g,:pl

  def initialize(x,y,image)
    @x1 = x * 2
    @y1 = y
    @move = 4.0
    @jflag = false
    @vy = 0
    @vy0 = -12.0
    @g = 0.5
    super
  end
  
  def update#(island)
	if (Input.key_down?(K_RIGHT) && self.x < @x1-self.image.width ) # →キーを押したか
		self.x += @move;
	end
	if (Input.key_down?(K_LEFT) && self.x > 0 ) #←キーを押したか
		self.x -= @move;
	end
	
	if (@jflag)
		self.y += @vy;
		if(@vy==0)
		  p self.y
		end
		#self.collision=(self.x, self.y, self.x+self.image.width, self.y+self.image.height)
		#Sprite.check(island, @pl)
		if ( @vy == @vy0 * (-1.0) )
			@jflag = false;
		end
		@vy += @g;
	else 
		if (Input.key_down?(K_SPACE))
			@jflag = true;
			@vy = @vy0;
		end
	end
  end
  
  def shot
    @jflag = false;
  end  
end