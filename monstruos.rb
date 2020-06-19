class Monstruos
	attr_accessor :nombre
	attr_reader :max_pv, :vivo, :danio, :def, :velocidad, :current_pv

	def initialize (monsnum)
		if monsnum == 0

			@nombre = "Zombie"
			@max_pv = 10
			@current_pv = @max_pv
			@danio = 2+rand(3)
			@def = 1
			@vivo = true
			@velocidad = rand(21)

		else

			@nombre = "Arania toxica"
			@max_pv = 7
			@current_pv = @max_pv
			@danio = 2
			@def = 0
			@vivo = true
			@velocidad = rand(11)

		end
	end

	def recibir_danio(danio)
		danio -= @def 
		@current_pv -= danio if danio > 0
	end

	def check
		self.morir if @current_pv <= 0
	end

	def morir
		@vivo = false
		puts "Has vencido!\n"
	end
end