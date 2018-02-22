def arreglo(array, multp)
	array.each_with_index do |element, index|
		array[index] = array[index] * multp
	end
	p array
end

prueba1 = [1, 2, 3]
arreglo(prueba1, 3)