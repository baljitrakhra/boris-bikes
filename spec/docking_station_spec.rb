require 'boris_bike'

describe DockingStation do
  it 'looks for method release_bike' do
    # docking_station = DockingStation.new
    expect(release_bike).to eq 'true'
  end
end
