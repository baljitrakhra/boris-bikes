require 'bike.rb'

describe Bike do
  it "is the bike working" do
    expect(subject.working?).to eq true
  end

  it "'s status becomes broken when reported broken" do
    subject.report_broken
    expect(subject.working?).to eq false
  end
    
end