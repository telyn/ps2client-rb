require "ps2/client/packets/execee"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::ExecEE do
  subject(:instance) { described_class.new(*argv) }
  let(:argv) { ["test.elf"] }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3]).to eq("\0\0\0\x01")
      expect(subject[4..12]).to eq "test.elf\0"
      expect(subject[13..-1].split("").all? { |x| x == "\x00" }).to be true
    end

    it "has correct length" do
      expect(subject.length).to eq 260
    end
  end

  it_behaves_like "packet", 0xbabe0203
end
