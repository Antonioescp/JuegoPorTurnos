class Personaje
	attr_accessor :nombre
	attr_reader :vivo, :current_pv, :max_pv, :magia, :velocidad, :mana, :danio, :def

	def initialize(nombre)
		@nombre = nombre
		@max_pv = 10
		@current_pv = @max_pv
		@magia = 3
		@max_mana = 10
		@mana = 10
		@nv = 1
		@exp = 0
		@vivo = true
		@velocidad = 10
		@danio = 5
		@def = 1

	end

	def check
		@mana += 1 if @mana < 10
		self.morir if @current_pv <= 0

		puts "Recuperas 1 de mana!\n\n" if @vivo == true
		gets
	end

	def fin_de_combate
		exp_ganada = 5+rand(6)
		@exp += exp_ganada
		puts "\n\nHas ganado #{exp_ganada} puntos de experiencia"
		puts "Tienes #{@exp} puntos de experiencia"
		gets

		self.subir_nivel if @exp >= 50
	end

	def subir_nivel

		@nv += 1
		@exp -= 50
		@max_pv += 2 + rand(5)
		@max_mana += 2 + rand(5)
		@velocidad += 2 + rand(5)

		puts "\n\nHas subido de nivel, a nivel #{@nv}\n\n"

		puts "Aqui estan tus nuevas estadisticas:\n"
		puts "Puntos de vida: #{@max_pv}"
		puts "Mana: #{@max_mana}"
		puts "Velocidad: #{@velocidad}"
		puts "Exp restante: #{@exp}\n\n"

	end

	def morir
		@vivo = false
		puts "Has sido derrotado!\n"
	end

	def recibir_danio(danio)
		danio -= @def 
		@current_pv -= danio if danio > 0
	end

	def drenar
		@current_pv += @magia-@magia*0.5
		@current_pv = @max_pv if @current_pv > @max_pv
		@mana -= 2
	end
end