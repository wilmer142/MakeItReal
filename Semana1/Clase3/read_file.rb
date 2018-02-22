archivo = File.read("texto.txt")
lineas = IO.readlines("texto.txt")
lineas.each	do |element|
	puts element
end
puts "--------------------------"
 puts File.file?("texto.txt") ? "verdadero" : "falso"

