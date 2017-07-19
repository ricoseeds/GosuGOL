require 'gosu'
require 'rubygems'
class Golu < Gosu::Window
  def initialize
    super(490,490,false)
    self.caption="grid"
    @white=Gosu::Image.new("white.jpg",:tileable =>false)
    @black=Gosu::Image.new("black.jpg",:tileable =>false)
    @x=140
    @y=140
    @locs=[]
  end
  def needs_cursor?; true; end
  def draw
    j=0
    for i in 0..10
      draw_line(@x,@y+j,0xffffffff,@x+250,@y+j,0xffffffff)
      draw_line(@x+j,@y,0xffffffff,@x+j,@y+250,0xffffffff)
      j+=25
    end
    @locs.each do |i|
      @white.draw(i[0]-10,i[1]-10,0)
    end

  end
  def update
  end
  def button_down(id)
    case id
    when Gosu::MsLeft
      a=mouse_x.to_i
      puts "before correction a #{a}"
      b=mouse_y.to_i
      puts "before correction b #{b}"
      c=a%25
      d=b%25
      if(c<=15)
        a=a-c
         puts "after correction a#{a}"
        if(d<=15)
          b=b-d
          @locs << [a,b]
           puts "after correction b#{b}"
        else
          d=25-d
          b=b+d
          @locs << [a,b]
         
        puts "after correction b #{b}"
        end
      else
        c=25-c
        a=a+c
        puts "after correction a #{a}"
        if(d<=15)
          b=b-d
          @locs << [a,b]
          puts "after correction b #{b}"
        else
          d=25-d
          b=b+d
          @locs << [a,b]
          
        puts "after correction b #{b}"
        end
      end
    end
  end


end
Golu.new.show