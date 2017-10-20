class LegResult

  include Mongoid::Document

  field :secs, type: Float
  field :event, type: Event

  embedded_in :entrant
  embeds_one :event, as: :parent

  validates_presence_of :event

  def calc_ave
  end

  after_initialize do |doc|
  end

  def secs=value
  	self[:secs] = value
  	self.calc_ave
  end

end
