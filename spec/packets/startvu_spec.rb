require "ps2/client/packets/startvu"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::StartVU do
  subject(:instance) { described_class.new(vu) }
  let(:vu) { 1 }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("N")).to eq 1
    end

    it "has correct length" do
      expect(subject.length).to eq 4
    end
  end

  it_behaves_like "packet", 0xbabe0208
end
