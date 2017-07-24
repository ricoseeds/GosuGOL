class FileExtract
	attr_accessor :n
	attr_accessor :first_matrix

	def initialize filename ,n,first_matrix
		@filename = filename
		@n = n
		@first_matrix = first_matrix
	end

	def fetch
		@n = File.open(@filename) {|n| n.readline}.to_i
		puts @n
		@first_matrix = File.readlines(@filename).drop(1).each do |line| 
			@first_matrix = File.open(@filename) {|first_matrix| first_matrix.readline}.to_i
 		end
		a = []
		@first_matrix.each do |row|
			a << row.split(" ").map(&:to_i)
		end
		puts @first_matrix
		@first_matrix = a
	end
end
<<<<<<< HEAD
# object = FileExtract.new("test.txt",@n,@first_matrix)
# object.fetch
# 


=======
# d = GameGOL::FileExtract.new("test.txt")
# d.fetch
# dimension= d.n
# puts dimension
# array = d.first_matrix
# puts array
>>>>>>> aea98cff17df5071e3a4b07d11f0c847c8d623ae
