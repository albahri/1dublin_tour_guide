class BasicTour
	def initialize(name, place, date, time, cost, description)
		@name = name
		@place = place
		@date = date
		@time = time
		@cost = 50
		@description = description
	end

	#getter method
	def place
		return @place
	end
	def cost
		return @cost
	end 
	
end

#decorator class -- this serves as the superclass for all the concrete decorators
class TourDecorator
	def initialize(real_tour)
		@real_tour = real_tour
		@extra_cost = 0
	end

	def place
		return @real_tour.place
	end

	def cost
		return  @extra_cost + @real_tour.cost
	end

	
end 

#a concrete decorator
class  AudioTourDecorator < TourDecorator
	def initialize(real_tour)
		super(real_tour)
		@extra_cost = 10
	end 

end

class  LunchDecorator < TourDecorator
	def initialize(real_tour)
		super(real_tour)
		@extra_cost = 15
	end 

end


