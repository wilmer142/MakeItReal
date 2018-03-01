module Menu
	
	class Menu

		attr_accessor :platillos

		def initialize
			@platillos = Hash.new
		end

		def carga_masiva(nombre_archivo)
			if File.file?("nombre_archivo")
				array_platillos=File.open(nombre_archivo).read
				array_platillos.gsub!(/\r\n?/, "\n")
				recorrer_archivo(array_platillos)
			else
				false
			end
		end

		def carga_unitaria(codigo, platillo, precio, disponible)
			platillo = {platillo: platillo, precio: precio, disponible: disponible}
			@platillos(codigo) = platillo
			true
		end

		private

		def recorrer_archivo(array_platillos)
			num_platillos = 0

			array_platillos.each_line do |line|
  			line = line.split(",")
  			platillo = {platillo: line[1], precio: line[2], disponible: line[3]}
  			@platillos[line[0]] = platillo
  			num_platillos += 1
  		end
  		num_platillos
  	end

	end

	class PermissionDeniedError < StandardError
  	attr_reader :action

	  def initialize(message, action)
	    # Call the parent's constructor to set the message
	    super(message)

	    # Store the action in an instance variable
	    @action = action
	  end
	end

end
