# coding: utf-8

class Player < Sprite
  attr_accessor :x1,:y1,:move,:jflag,:vy,:vy0,:g

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
  
  def update
	if (Input.key_down?(K_RIGHT) && self.x < @x1-self.image.width ) # → キー を押したか
		self.x += @move;
	end
	if (Input.key_down?(K_LEFT) && self.x > 0 ) # ← キー を押したか
		self.x -= @move;
	end
	
	if (@jflag)
		self.y += @vy;
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
	
#	if(@jflag == true)
#		@y_temp = self.y;
#		self.y += (self.y - @y_prev) + 1;
#		@y_prev = @y_temp;
#		if(self.y == @y1)
#			@jflag = false;
#		end
#	end
#	
#	if(Input.key_down?(K_SPACE) && @jflag == false)
#		@jflag = true;
#		@y_prev = self.y;
#		self.y = self.y - 20;
#	end
  end
end