class GosuGOL
	attr_accessor :original, :next_gen, :n, :alive_cells

	def initialize(params, dimension)
		@n = dimension
		@original = Array.new(@n){ Array.new(@n, 0) }
		params.each do |dimen_one_array|
			@original[dimen_one_array[0]][dimen_one_array[1]] = 1
		end
	end

	def neighbours
		@next_gen = Array.new(@n){ Array.new(@n, 0) }
		for i in 0..@n - 1
			for j in 0..@n - 1
				temp = neighbour_count(i,j)
				if temp == 1
					@next_gen[i][j] = 0
				elsif temp == 2  and @original[i][j] == 1
					@next_gen[i][j] = 1
				elsif temp == 3  and @original[i][j] == 1
					@next_gen[i][j] = 1
				elsif temp == 3 and @original[i][j] == 0
					@next_gen[i][j] = 1
				elsif temp > 3
					@next_gen[i][j] = 0
				end
			end
		end
		@next_gen
	end

	def evolve
		@original = neighbours
		@alive_cells = []
		for i in 0..@n - 1
			for j in 0..@n - 1
				@alive_cells << [i, j] if @original[i][j] == 1
			end
		end
		@alive_cells
	end

  def boundary?(x, y)
    if x - 1 < 0 || y - 1 < 0 || x + 1 > @rows || y + 1 > @cols
      return false
    end
    true
  end

	def neighbour_count(i, j)
		temp = 0
		if j+1 >= 0 and j+1 <= @n-1
			if @original[i][j+1] == 1
				temp+=1
			end
		end
		if j-1 <= @n-1 and j-1 >= 0

			if @original[i][j-1] == 1
				temp+=1
			end
		end
		if i+1 >= 0and i+1 <= @n-1
			if @original[i+1][j] == 1
				temp+=1
			end
		end
		if i-1 >= 0 and i-1 <= @n-1
			if @original[i-1][j] == 1
				temp+=1
			end
		end
		if i-1 >= 0 and i-1 <= @n-1 and j-1 >= 0 and j-1 <= @n-1
			if @original[i-1][j-1] == 1
				temp+=1
			end
		end
		if i-1 >= 0 and i-1 <= @n-1 and j+1 >= 0 and j+1 <= @n-1
			if @original[i-1][j+1] == 1
				temp+=1
			end
		end
		if i+1 >= 0 and i+1 <= @n-1 and j-1 >= 0 and j-1 <= @n-1
			if @original[i+1][j-1] == 1
				temp+=1
			end
		end
		if i+1 >= 0 and i+1 <= @n-1 and j+1 >= 0 and j+1 <= @n-1
			if @original[i+1][j+1] == 1
				temp+=1
			end
		end
	  temp
	end
end

# board_detail = GameGOL::FileExtract.new("test.txt")
# board_detail.fetch
# game = GosuGOL.new(board_detail.first_matrix)
# binding.pry 
# game.evolve
			
			

			
			
			
			
			
			
		
		
			


