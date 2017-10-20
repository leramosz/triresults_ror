class RunResult < LegResult

  include Mongoid::Document
  
  field :mmile, as: :minute_mile, type: Float
  # field :my_ave, type: Float

  def calc_ave
	if event && secs
		miles = event.miles
		self.mmile = miles.nil? ? nil : ( secs / 60 ) / miles
	end 
  end

  def mmile
  	self.calc_ave
  end

end
