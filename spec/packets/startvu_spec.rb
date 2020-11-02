require "ps2/client/packets/startvu"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::StartVU do
  subject(:instance) { described_class.new(vu) }
  # in reality only 0 or 1 are valid but.. what the heck, the protocol supports
  # an arbitrary int32
  let(:vu) { fake_int32 }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("l>")).to eq vu
    end
  end

  it_behaves_like "packet", 0xbabe0208, length: 4
end
