require "station"
describe Station do
  station = Station.new("Paddington", "zone 1")
  it "shows the station name" do
    expect(station.name).to eq "Paddington"
  end
  it "shows the station zone" do
    expect(station.zone).to eq "zone 1"
  end
end
