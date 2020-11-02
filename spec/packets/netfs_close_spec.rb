require "ps2/client/packets/netfs_close"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::NetFS::Close do
  subject(:instance) { described_class.new(fd) }
  let(:fd) { 0xbeefd00d }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("N")).to eq 0xbeefd00d
    end

    it "has correct length" do
      expect(subject.length).to eq 4
    end
  end

  it_behaves_like "packet", 0xbeef8021
end
