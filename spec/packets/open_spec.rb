require "ps2/client/packets/open"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::Open do
  subject(:instance) { described_class.new(pathname, flags) }

  let(:pathname) { fake_file.freeze }
  let(:flags) { fake_int32 }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("l>")).to eq flags
      expect(subject[4...(pathname.length + 4)]).to eq pathname
      expect(subject[(pathname.length + 4)..-1].split("").all? { |x| x == "\0" }).to be true
    end
  end

  it_behaves_like "packet", 0xbabe0111, length: 4 + 266
end
