require 'boris_bike'

describe DockingStation do
  it 'looks for method release_bike' do
    docking_station = DockingStation.new
    expect(docking_station.release_bike).to be_an_instance_of(Bike)
  end
end
