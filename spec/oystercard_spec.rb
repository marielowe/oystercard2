require "oystercard"
describe OysterCard do
  it "starts with a balance of 0" do
    expect(subject.balance).to eq 0
  end
  it "adds money to card" do
    subject.top_up(2)
    expect(subject.balance).to eq 2
  end
end
