archivo = File.readlines("students.txt")
((archivo.length)/2).times do |i|
	puts "pareja(#{i+1}):"
	2.times do |y|
		archivo.shuffle!
		puts archivo.pop
	end
	puts ""
end