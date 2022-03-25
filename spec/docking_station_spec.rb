require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    let(:bike) { double :bike }
    it "releases a bike" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end
    
    it "will only release bikes that are working" do
      allow(bike).to receive(:report_broken).and_return(false)
      allow(bike).to receive(:working?).and_return(false)
      bike.report_broken
      station = DockingStation.new
      station.dock(bike)
      expect(station.release_bike).to eq "No working bikes avaliable"  
    end

  end

  describe '#docking capacity check' do
   it 'allows user to set the docking station capacity' do
   capacity = 30
   docking_station = DockingStation.new(capacity)
   expect(docking_station.capacity).to eq capacity
   end
  
  
    it 'checks that the docking station capacity is set to default 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
   end
  
   describe '#dock' do
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
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
    bike = double(:bike)
    expect(subject.dock(bike)).not_to be_empty
  end

  it "returns docked bikes" do
    bike = double(:new)
    subject.dock(bike)
    subject.bikes
    expect(subject.bikes).not_to be_empty
  end

  




end