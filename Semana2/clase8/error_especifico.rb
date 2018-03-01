def error(num)
	if num <= 10
		raise RuntimeError.new("El argumento es invalido")
	end
end

error(8)