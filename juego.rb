require_relative 'personaje'
require_relative 'monstruos'

# creacion de personaje
puts "ingrese su nombre"
nombre = gets.chomp
p1 = Personaje.new(nombre)

# prologo
puts "Te llamas #{p1.nombre} y eres el nuevo heroe de este mundo tan destruido y debastado por todos"
puts "Te llenas de determinacion"

puts "\nTus estadisticas son\n"
puts "Puntos de vida: #{p1.max_pv}"
puts "Mana: #{p1.mana}"
puts "Danio: #{p1.danio}"
puts "Velocidad: #{p1.velocidad}"

puts "Presiona enter para salir de aventura"

gets

puts "Sales al baldio sin saber que te espera"

gets

puts

# inicio de combate

loop do

	# Creacion de monstruo aleatorio
	m1 = Monstruos.new(rand(2))

	puts "Oh no, ha aparecido un Zombie, cuida tus sesos" if m1.nombre == "Zombie"

	puts "Oh no, una arania toxica, como tu ex, cuidado, no caigas en sus mentiras" if m1.nombre == "Arania toxica"

	gets

	puts 
	# Inicio combate
	# Decision de primer ataque

	# si jugador es mas rapido
	if p1.velocidad > m1.velocidad

		puts "Atacas primero\n\n"

		gets 

		# combate por turnos
		loop do

			puts "#{m1.nombre} \npv: #{m1.current_pv}\n\n"
			puts "#{p1.nombre} \npv: #{p1.current_pv} \nmana: #{p1.mana}\n"

			puts "\n1.Atacar"
			puts "2.Drenar (costo mana: 2)\n"

			puts "opcion: "
			accion = gets.to_i

			case accion
				when 1
					m1.recibir_danio(p1.danio)

					puts "\nhas hecho #{p1.danio-m1.def} de danio a #{m1.nombre}\n"
					gets
				when 2
					m1.recibir_danio(p1.magia) if p1.mana >= 2
					puts "\nmana insuficiente\n" if p1.mana < 2
					puts "\nhas hecho #{p1.magia} de danio a #{m1.nombre} y te has curado #{p1.magia-p1.magia*0.5}\n" if p1.mana >= 2
					gets
					p1.drenar if p1.mana >= 2

					

					
			end

			m1.check

			if m1.vivo == true
				puts "#{m1.nombre} ataca!"
				gets
				p1.recibir_danio(m1.danio)
				puts "#{m1.nombre} te ha hecho un danio de #{m1.danio-p1.def}\n\n"
				gets
			end

			p1.check
		
			break if p1.vivo == false || m1.vivo == false
		end
				

	# si monstruo es mas rapido
	else

		puts "#{m1.nombre} ataca primero"

		gets

		# combate por turnos
		loop do

			puts "#{m1.nombre} ataca!"
			p1.recibir_danio(m1.danio)
			puts "#{m1.nombre} te ha hecho un danio de #{m1.danio-p1.def}\n\n"

			gets

			p1.check

			if p1.vivo == true

				puts "#{m1.nombre} \npv: #{m1.current_pv}\n\n"
				puts "#{p1.nombre} \npv: #{p1.current_pv} \nmana: #{p1.mana}\n"

				puts "\n1.Atacar"
				puts "2.Drenar (costo mana: 2)\n"

				puts "opcion: "
				accion = gets.to_i

				case accion
					when 1
						m1.recibir_danio(p1.danio)

						puts "\nhas hecho #{p1.danio-m1.def} de danio a #{m1.nombre}\n"
						gets
					when 2
						m1.recibir_danio(p1.magia) if p1.mana >= 2
						puts "\nmana insuficiente\n" if p1.mana < 2
						puts "\nhas hecho #{p1.magia} de danio a #{m1.nombre} y te has curado #{p1.magia-p1.magia*0.5}\n" if p1.mana >= 2
						gets
						p1.drenar if p1.mana >= 2
				end

			end

			
			m1.check

			break if p1.vivo == false || m1.vivo == false
		end
	end
	
	if p1.vivo == true
		p1.fin_de_combate
		puts "Deseas continuar (0/1)"
		response = gets.to_i
	end

	break if p1.vivo == false || response == 0
end

puts "Fin del juego, Gracias por jugar"