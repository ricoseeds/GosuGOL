require "gosu"
require_relative 'game_of_life' 
class GameOfLife < Gosu::Window

	def initialize width= 800,height = 800,fullscreen=false
		super
		@window_size = @width = @height = 800
		@no_of_cols = 10
		@cell_size = @window_size / @no_of_cols
		@new_array = Array.new(@no_of_cols){Array.new(@no_of_cols )}
		# binding.pry

		@empty_array =[]
		# @new_array =[]
		@white = Gosu::Image.new("white.jpg", {tileable: false ,rect: [0,0,@cell_size,@cell_size]})
		# @black = Gosu::Image.new("images", {tileable: false ,rect: [0,0,@cell_size,@cell_size]})
		# @game = GameLife.new(@empty_array , @no_of_cols)
		 # @game.next_generation

	end
	def needs_cursor?
    true
  end
  def update
  
  end
 
	def draw
		i = 0
		while i < @window_size
			draw_line(0 + i, 0, 0xff_ffffff, 0 + i , 0 + @window_size, 0xff_ffffff)
      draw_line(0, 0 + i, 0xff_ffffff, 0 + @window_size , 0 + i, 0xff_ffffff)
      i = i + @cell_size
      @empty_array.each do |i|
     		@white.draw(i[0],i[1] ,0)
    	end    
    end 
	end

	def button_down id
		case id
			when  Gosu::KB_ESCAPE
				close
			when Gosu::MS_LEFT
					a = mouse_x.to_i
					b = mouse_y.to_i		
					c = a % @cell_size
					d = b % @cell_size
					a = a - c
					e = a / @cell_size
					b = b - d
					f = b / @cell_size
					@empty_array << [a,b]
					# @new_array.each do |l|
					# 		@new_array << [e,f]
					# 	end
					# 	puts @new_array

					puts "#{e} , #{f}"

			# when Gosu::KB_RIGHT
         # @empty_array = @game.next_generation
		end
	end
end
GameOfLife.new.show


