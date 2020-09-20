require "ps2/client/packets/writemem"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::WriteMem do
  subject(:instance) { described_class.new(0x205, 0x40A, "test.rom") }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("N")).to eq 0x205
      expect(subject[4..7].unpack1("N")).to eq 0x40A
      expect(subject[8..15]).to eq "test.rom"
      expect(subject[16..-1].split("").all? { |x| x == "\0" }).to be true
    end

    it "has correct length" do
      expect(subject.length).to eq 4 + 4 + 256
    end
  end

  it_behaves_like "packet", 0xbabe020c
end
