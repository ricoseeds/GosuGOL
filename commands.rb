require 'pry'
class Commands

	def initialize 
	end

	def commands
		
		puts "Enter a command:"
		prompt = gets.chomp
		p = prompt.split(" ")
		source = p[1]
		target = p.last
		source_file = File.open(source) 
		data = source_file.read()
		target_file = File.open(target , 'w')
		target_file.write(data)

	end
	def rm
		puts "Enter a command:"
		prompt = gets.chomp
		p = prompt.split(" ")
		pt=p.last
		File.delete(pt)
	end
	def GrepSensitive
		puts "Enter Command"
		prompt = gets.chomp
		p = prompt.split(" ")
		string = p[1]
		source_file = p.last
		filename = File.open(source_file)
		source_data = filename.read()
		abc = source_data.split(" ")
		abc.each do |arg|
			if arg == string
				puts arg
			end
		end
	end
	def GrepInsensitive
		puts "Enter Command"
		prompt = gets.chomp
		p = prompt.split(" ")
		string = p[1]
		source_file = p[2]
		filename = File.open(source_file)
		source_data = filename.read()
		abc = source_data.split(" ")
		abc.each do |arg|
			if arg == string
				puts arg
			end
			if arg == string.downcase
				puts arg
			end
			if arg == string.upcase
				puts arg
			end
		end
	end
end
object = Commands.new
# object.commands
# object.rm
object.GrepInsensitive