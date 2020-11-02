require "ps2/client/packets/read_reply"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::ReadReply do
  subject(:instance) { described_class.new(result, size) }
  let(:result) { fake_int32 }
  let(:size) { fake_int32 }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("l>")).to eq result
      expect(subject[4..7].unpack1("l>")).to eq size
    end

    it "has correct length" do
      expect(subject.length).to eq 4 + 4
    end
  end

  it_behaves_like "packet", 0xbabe0132
end
