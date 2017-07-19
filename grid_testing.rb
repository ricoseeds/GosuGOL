require 'gosu'
require_relative 'gosu_gol'

class Golu < Gosu::Window
  def initialize
    super( 500, 500, false )
    @window_size = 500
    @dimension = 40
    self.caption = "Conways game of life"
    @factor = @window_size / @dimension
    image_height = image_width = @factor
    @white = Gosu::Image.new("white.jpg", {tileable: false, rect: [0, 0, image_width, image_height]})
    @black = Gosu::Image.new("black.jpg", {tileable: false, rect: [0, 0, image_width, image_height]})
    @x = 0
    @y = 0
    @factor = @window_size / @dimension
    @actual_coord = []
    @next_gen_flag = false
  end

  def needs_cursor?; true; end

  def gridify
    i = 0 
    while i < @window_size
      draw_line(@x + i, @y, 0xff_ffffff, @x + i , @y + @window_size, 0xff_ffffff)
      draw_line(@x, @y + i, 0xff_ffffff, @x + @window_size , @y + i, 0xff_ffffff)
      i += @factor
    end
  end

  def draw
    gridify
    @actual_coord.each do |coordinate|
      window_coord = flip_coord(coordinate)
      @white.draw(window_coord[0] * @factor,window_coord[1] * @factor, 0)
    end
  end

  def flip_coord(coord)
    [coord[1], coord[0]]
  end

  def update
    # if @next_gen_flag == true 
    #   @actual_coord = @game_instance.evolve
    #   sleep(0.5)
    # end
  end

  def button_down(id)
    case id
    when Gosu::KB_ESCAPE
      close
    when Gosu::KB_RIGHT 
      if !@next_gen_flag
        @next_gen_flag = true
        @game_instance = GosuGOL.new(@actual_coord, @dimension)
        @actual_coord = @game_instance.evolve
      else
        @actual_coord = @game_instance.evolve
      end
    when Gosu::MsLeft
      coord_map = [mouse_x.to_i / @factor, mouse_y.to_i / @factor]
      if !@actual_coord.include? flip_coord(coord_map)
        @actual_coord << flip_coord(coord_map)
      else
        @actual_coord.delete(flip_coord(coord_map))
      end
      # puts @actual_coord.join(", ")
    end
  end
end
Golu.new.show