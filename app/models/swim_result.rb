class SwimResult < LegResult

  include Mongoid::Document
  
  field :pace_100, type: Float

  def calc_ave
	if event && secs
		meters = event.meters
		self.pace_100 = meters.nil? ? nil : secs / ( meters / 100 ) 
	end 
  end

  def pace_100
  	self.calc_ave
  end

end
