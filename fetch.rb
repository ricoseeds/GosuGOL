require './file_extract.rb'
object = FileExtract.new("test.txt")
object.fetch
dimension = object.n
puts @dimension