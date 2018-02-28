#Construir una aplicación que permita registrar los ingresos y gastos de una persona, debe existir 
#suficiente dinero para poder hacer el gasto, se debe poder ver el total de ingresos y gastos para mes particular.

require "./modulo_categorias.rb"

class Movimientos
	include Categorias
	attr_accessor :transacciones, :categorias
end

class Persona < Movimientos
	attr_accessor :nombre, :presupuesto_total

	def initialize(nombre)
		@nombre = nombre
		@transacciones = Array.new
		@categorias = Hash.new
		@presupuesto_total = 0
	end

	def ingreso(descripcion, valor, mes)
		movimiento = {detalle: "Ingreso", descripcion: descripcion, valor: valor, mes: mes}
		@presupuesto_total += valor
		@transacciones.push(movimiento)
	end

	def gasto(descripcion, valor, mes, categoria)
		if valor > @presupuesto_total
			puts "No se puede realizar el gasto, su valor excede el presupuesto maximo de la cuenta: #{@presupuesto_total}" 
		elsif !@categorias.key?(categoria)
			puts "La categoria reportada no existe: #{@categorias.inspect}"
		elsif valor > @categorias[categoria].to_i
			puts "No se puede realizar el gasto, su valor excede el monto maximo asignado a la categoria: #{@categorias[categoria]}" 
		else
			movimiento = {detalle: "Gasto", descripcion: descripcion, valor: valor, mes: mes, categoria: categoria}
			@presupuesto_total -= valor
			@transacciones.push(movimiento)	
		end
	end

	def consultar_movimientos(mes)

		if validar_mes(mes)
			ingresos = 0
			gastos = 0
			transacciones = 0

			puts "Sus transacciones en el mes #{mes} son:"

			@transacciones.each do |movimiento|
				if movimiento[:mes] == mes
					puts "---- #{movimiento.inspect}"
					transacciones += 1
					movimiento[:detalle] == "Ingreso" ? ingresos += movimiento[:valor] : gastos += movimiento[:valor]
				end
			end

			mostrar_transacciones(transacciones, ingresos, gastos)
		else
			puts "Debe ingresar un mes valido (1..12)"
		end
	end

	def registrar_categoria(categoria, presupuesto)
			@categorias[categoria] = presupuesto
	end

	def mostrar_categorias()
		@categorias.each do |key, value|
			puts "--categoria: #{key}, monto maximo: #{value}"
		end
	end

	def porcentaje_categorias
		categorias = CategoriasPorcentaje.new
		categorias.calcular_porcentaje(@transacciones)
	end

	private

	def validar_mes(mes)
		(mes <= 12 && mes >= 1) ? true : false
	end

	def mostrar_transacciones(transacciones, ingresos, gastos)
		puts "-- # Transacciones: #{transacciones}"
		puts "-- Total de Ingresos: #{ingresos}"
		puts "-- Total de Gastos: #{gastos}"
		puts "-- Balance reportado: #{ingresos-gastos}"	
	end

end
