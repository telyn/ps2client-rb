require "ps2/client/packets/dumpreg"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::DumpReg do
  subject(:instance) { described_class.new(type, pathname) }
  let(:type) { fake_int32 }
  let(:pathname) { fake_file }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("l>")).to eq type
      expect(subject[4...(pathname.length + 4)]).to eq pathname
      expect(subject[(pathname.length + 4)..-1].split("").all? { |x| x == "\0" }).to be true
    end

  end

  it_behaves_like "packet", 0xbabe020a, length: 4 + 256
end
