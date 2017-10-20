class BikeResult < LegResult

  include Mongoid::Document

  field :mph, type: Float
  # field :my_ave, type: Float

  def calc_ave
	if event && secs
		miles = event.miles
		self.mph = miles.nil? ? nil : miles * 3600 / secs 
	end 
  end

  def mph
  	self.calc_ave
  end
  
end
