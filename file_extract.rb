module GameGOL
	class FileExtract
		attr_reader :n, :first_matrix

		def initialize file 
			@filename = file
		end

		def fetch
			@n = File.open(@filename) {|n| n.readline}.to_i
			@first_matrix = File.readlines(@filename).drop(1).each do |line| 
				@first_matrix = File.open(@filename) {|first_matrix| first_matrix.readline}.to_i
	 		end
			a = []
			@first_matrix.each do |row|
				a << row.split(" ").map(&:to_i)
			end
			@first_matrix = a
		end
	end
end
sbjrb