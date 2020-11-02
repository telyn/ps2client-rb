require "ps2/client/packets/read"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::Read do
  subject(:instance) { described_class.new(fd, size) }
  let(:fd) { 0xbeefd00d }
  let(:size) { 0x87654321 }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("N")).to eq 0xbeefd00d
      expect(subject[4..7].unpack1("N")).to eq 0x87654321
    end

    it "has correct length" do
      expect(subject.length).to eq 4 + 4
    end
  end

  it_behaves_like "packet", 0xbabe0131
end
