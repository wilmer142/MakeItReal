module Errors

	class FileNotFoundError < StandardError

	  def initialize(message)
	    super(message)
	  end  
	end

	class PlatilloNotFoundError < StandardError

		def initialize(message)
			super(message)
		end
	end

	class OrdenNotFoundError < StandardError
		
		def initialize(message)
			super(message)
		end
	end

	class PlatilloAlreadyExistsError < StandardError
		
		def initialize(message)
			super(message)
		end
	end

	class PlatilloNotAvailableError < StandardError
		
		def initialize(message)
			super(message)
		end
	end
end