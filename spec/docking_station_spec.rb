require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  it 'raises an error when there are no bikes available' do
    # Let's not dock a bike first:
    # remember subject == DockingStation.new
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it "docks something" do
    bike = Bike.new
    expect(subject.dock(bike)).not_to be_empty
  end

  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    subject.bikes
    expect(subject.bikes).not_to be_empty
  end
end