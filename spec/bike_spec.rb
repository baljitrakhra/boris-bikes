require 'boris_bike'
describe Bike do
  it "is the bike working" do
  bike = Bike.new
   expect(bike.working?).to eq 'true'
  end
    
end