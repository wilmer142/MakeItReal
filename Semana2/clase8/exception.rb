class Error
	
	def method
		begin 
			1/0
		rescue => e
			puts "ha ocurrido un error: #{e.message}"
			puts "bactrace: #{e.backtrace}"
		end
	end
end

e= Error.new
e.method