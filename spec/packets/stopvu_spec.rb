require "ps2/client/packets/stopvu"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::StopVU do
  subject(:instance) { described_class.new(vu) }
  let(:vu) { fake_int32 }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("l>")).to eq vu
    end

    it "has correct length" do
      expect(subject.length).to eq 4
    end
  end

  it_behaves_like "packet", 0xbabe0209
end
