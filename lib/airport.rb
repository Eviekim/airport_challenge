require_relative 'plane'
require_relative 'airport'
require_relative 'weather'

class Airport
  attr_reader :plane, :capacity, :weather
  DEFAULT_CAPACITY = 50
  DEFAULT_WEATHER = "fine"

  def initialize(capacity = DEFAULT_CAPACITY, weather = DEFAULT_WEATHER)
    @capacity = capacity
    @weather = weather
    @landing = []
    @takingoff = []

  end

  def land(plane)
    fail "landing is not available due to this bad weather" if weather != "fine"
    fail "you can't land now - airport is too busy" if airport_busy?
    @landing << plane
  end

  def takingoff(plane)
    fail "takingoff is not available due to this bad weather" if weather != "fine"
    @takingoff << plane
  end

  def airport_busy?
    landing.length >= capacity
  end
end
