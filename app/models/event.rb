class Event

  include Mongoid::Document

  field :o, as: :order, type: Integer
  field :n, as: :name, type: String
  field :d, as: :distance, type: Float
  field :u, as: :units, type: String

  embedded_in :parent, polymorphic: true, touch: true

  validates_presence_of :order, :name

  def meters
  	case
  		when u == "kilometers" then d * 1000
  		when u == "yards" then d * 0.9144
  		when u == "miles" then d * 1609.34
  		when u == "meters" then d
  		else nil
  	end
  end

  def miles
	case
		when u == "kilometers" then d * 0.621371
		when u == "yards" then d * 0.000568182
		when u == "meters" then d * 0.000621371
		when u == "miles" then d
		else nil
	end
  end
  
end
