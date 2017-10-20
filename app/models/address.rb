class Address
  include Mongoid::Document

  attr_accessor :city, :state, :location
  
  field :city, type: String
  field :state, type: String
  field :location, type: Point

  def initialize(city = nil, state = nil, location = nil)
    @city = city
    @state = state
    @location = location.nil? ? nil : Point.new(location[:coordinates][0], location[:coordinates][1])
  end

  #creates a DB-form of the instance
  def mongoize
    {:city=>@city, :state=>@state, :loc=>Point.mongoize(@location)}
  end
  
  #creates an instance of the class from the DB-form of the data
  def self.demongoize(object)
    object.nil? ? nil : Address.new(object[:city], object[:state], object[:loc])
  end

  #takes in all forms of the object and produces a DB-friendly form
  def self.mongoize(object) 
    case object
      when Address then object.mongoize
      when Hash then Address.new(object[:city], object[:state], object[:loc]).mongoize
      when nil then nil
      else object
    end
  end
  
  #used by criteria to convert object to DB-friendly form
  def self.evolve(object)
    case object
      when Address then object.mongoize
      else object
    end
  end
end
