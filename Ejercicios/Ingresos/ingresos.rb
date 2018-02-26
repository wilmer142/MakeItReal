#Construir una aplicación que permita registrar los ingreso y gastos de una persona, debe existir 
#suficiente dinero para poder hacer el gasto, se debe poder ver el total de ingresos y gastos para mes particular.

class Movimientos
	attr_accessor :movimientos
end

class Persona < Movimientos
	attr_accessor :nombre, :presupuesto

	def initialize(nombre)
		@nombre = nombre
		@movimientos = Array.new
		@presupuesto = 0
	end

	def ingreso(descripcion, valor, mes)
		movimiento = {detalle: "Ingreso", descripcion: descripcion, valor: valor, mes: mes}
		@presupuesto += valor
		@movimientos.push(movimiento)
	end

	def gasto(descripcion, valor, mes)
		if valor > @presupuesto
			puts "No se puede realizar el gasto, su valor excede el presupuesto actual: #{@presupuesto}" 
		else
			movimiento = {detalle: "Gasto", descripcion: descripcion, valor: valor, mes: mes}
			@presupuesto -= valor
			@movimientos.push(movimiento)	
		end
	end

	def consultar_movimientos(mes)
		ingresos = 0
		gastos = 0
		tansacciones = 0

		puts "Sus movimientos en el periodo consultado son:"

		@movimientos.each do |movimiento|
			if mes == -1
				tansacciones += 1
				puts "---- #{movimiento.inspect}"
				movimiento[:detalle] == "Ingreso" ? ingresos += movimiento[:valor] : gastos += movimiento[:valor]
			elsif movimiento[:mes] == mes
				puts "---- #{movimiento.inspect}"
				tansacciones += 1
				movimiento[:detalle] == "Ingreso" ? ingresos += movimiento[:valor] : gastos += movimiento[:valor]
			end
		end

		puts "-- Total de transacciones realizadas: #{tansacciones}"
		puts "-- El Total de presupuesto disponible durante el periodo consultado es: #{ingresos-gastos}"	
	end
end

wilmer = Persona.new("Wilmer")
#--------------ENERO-----------------------
wilmer.ingreso("Pago de nomina", 3000000, 1)
wilmer.gasto("Pago de seguridad social", 400000, 1)
wilmer.gasto("Pago cuota apartamento", 1400000, 1)
wilmer.gasto("Compra Moto", 4000000, 1)
#--------------FEBRERO-----------------------
wilmer.ingreso("Pago de nomina", 3000000, 2)
wilmer.gasto("Prestamo papu", 2000000, 2)

wilmer.consultar_movimientos(2)