require_relative './bike.rb'

class DockingStation
  attr_reader :bike # Shorthand for def bike!

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
  end

  # def bike
  #   @bike
  # end
end
