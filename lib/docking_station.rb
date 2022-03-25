require_relative './bike.rb'

class DockingStation
  attr_reader :bikes # Shorthand for def bike

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty? # empty? is a private class method.
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full? 
    #if @bikes.count >= 20
    @bikes << bike
  end

  private
  
  def full?
    @bikes.count >= 20 ? true : false
  end

  def empty?
    @bikes.empty? 
  end 
end


