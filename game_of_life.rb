require './file_extract.rb' 


class GameLife
attr_accessor :first_matrix, :n

	 def initialize (first_matrix,n)
	 	@first_matrix = first_matrix
	 	@n =n
		# object.fetch
		# @n = object.n
		# @first_matrix = object.first_matrix
	 end


	def neighbour( i ,j)
		count = 0
		if (i-1 >= 0 && i-1 <= @n-1 && j-1 >= 0 && j-1 <= @n-1)
	 		if (@first_matrix[i-1][j-1] == 1)
	 			count += 1
	 		end
		end
		if(i-1 >= 0 && i-1 <= @n-1)
		 	if (@first_matrix[i-1][j] == 1)
	 			count += 1
	 		end
		end
		if(i-1 >= 0 && i-1 <= @n-1 && j+1 >= 0 && j+1 <= @n-1)
		 	if (@first_matrix[i-1][j+1] == 1)
	 			count += 1
			end
		end
		if (j-1 >= 0 && j-1 <= @n-1)
	 		if(@first_matrix[i][j-1] == 1)
	 			count += 1
	 		end
		end
		if (j+1 >= 0 && j+1 <= @n-1)
	 		if (@first_matrix[i][j+1] == 1)
	 			count += 1
			end
		end
		if (i+1 >= 0 && i+1 <= @n-1 && j-1 >= 0 && j-1 <= @n-1)
	 		if (@first_matrix[i+1][j-1] == 1)
	 			count += 1
	 		end
		end
		if (i+1 >= 0 && i+1 <= @n-1 )
	 		if (@first_matrix[i+1][j] == 1)
	 			count += 1
	 		end
		end
		if (i+1 >= 0 && i+1 <= @n-1 && j+1 >= 0  && j+1 <= @n-1)
	 		if (@first_matrix[i+1][j+1] == 1)
	 			count += 1
	 		end
		end
		return count
	end

	def next_generation 


		loop do
			new_matrix = Array.new(@n){Array.new(@n, 0)}
			for i in (0..@n-1)
				for j in (0..@n-1)	
					count = neighbour(i,j)
					if @first_matrix[i][j] == 1
						if count == 2 
							new_matrix[i][j] = 1
						end
						if count == 3 
							new_matrix[i][j] = 1
						end
						if count < 2  
					 		new_matrix[i][j] = 0
						end
						if count > 3
 							new_matrix[i][j] = 0
						end
					elsif @first_matrix[i][j] == 0 
						if count == 3
					new_matrix[i][j] = 1
						else
						new_matrix[i][j] = 0
					 	end
					end
				end
			end
			# printf "press 'n' to continue: "
			# prompt = STDIN.gets.chomp
			# return unless prompt == 'n'
			@first_matrix = new_matrix
			new_matrix.each { |q|puts q.join(" ")}
		end
	end
	# def evolve
 #    @first_matrix = next_generation
 #    @alive_cells = []
 #    for i in 0..@n - 1
 #      for j in 0..@n - 1
 #        @alive_cells << [i, j] if @first_matrix[i][j] == 1
 #      end
 #    end
 #    @alive_cells
 #  end
end

# object = GameLife.new(@first_matrix,@n)
# object.next_generation

	# next_generation(first_matrix,n)

# end
# d = FileExtract.new("test.txt")
# d.fetch
# d.next_generation


