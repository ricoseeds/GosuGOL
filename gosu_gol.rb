require './file_extract.rb'

class GosuGOL
	def initialize 
	end
	def neighbours(original,n)
		while true

			next_gen = Array.new(n){Array.new(n){0}}
			for i in 0..n-1
				for j in 0..n-1
					temp = 0
					temp = ninth(original,i,j,n)
					if temp == 1
						next_gen[i][j] = 0
					elsif temp == 2  and original[i][j] == 1
						next_gen[i][j] = 1
					elsif temp == 3  and original[i][j] == 1
						next_gen[i][j] = 1
					elsif temp == 3 and original[i][j] == 0
						next_gen[i][j] = 1
					elsif temp > 3
						next_gen[i][j] = 0
					end
				end
			end
			puts "please enter n for next generation"
			v = gets.chomp
			if v == "n"
				puts "next generation:"
				for i in 0..n-1
			 		for j in 0..n-1
			 			print next_gen[i][j],"\t"
			 		end
			 		print "\n"
				end
				print "\n"
				original = next_gen
				next
			else
				break
			end
		end
	end

	def ninth(original,i,j,n)
				temp = 0
				if j+1 >= 0 and j+1 <= n-1
					if original[i][j+1] == 1
						temp+=1
					end
				end
				if j-1 <= n-1 and j-1 >= 0

					if original[i][j-1] == 1
						temp+=1
					end
				end
				if i+1 >= 0and i+1 <= n-1
					if original[i+1][j] == 1
						temp+=1
					end
				end
				if i-1 >= 0 and i-1 <= n-1
					if original[i-1][j] == 1
						temp+=1
					end
				end
				if i-1 >= 0 and i-1 <= n-1 and j-1 >= 0 and j-1 <= n-1
					if original[i-1][j-1] == 1
						temp+=1
					end
				end
				if i-1 >= 0 and i-1 <= n-1 and j+1 >= 0 and j+1 <= n-1
					if original[i-1][j+1] == 1
						temp+=1
					end
				end
				if i+1 >= 0 and i+1 <= n-1 and j-1 >= 0 and j-1 <= n-1
					if original[i+1][j-1] == 1
						temp+=1
					end
				end
				if i+1 >= 0 and i+1 <= n-1 and j+1 >= 0 and j+1 <= n-1
					if original[i+1][j+1] == 1
						temp+=1
					end
				end
				return temp
	end
end

test=GosuGOL.new
d = GameGOL::FileExtract.new("test.txt")
d.fetch
n= d.n
puts n
original = d.first_matrix
puts original
test.neighbours(original,n)

			
			

			
			
			
			
			
			
		
		
			


