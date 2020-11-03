require "ps2/client/packets/stat"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::Stat do
  subject(:instance) { described_class.new(pathname) }

  let(:pathname) { fake_file.freeze }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0...(pathname.length)]).to eq pathname
      expect(subject[(pathname.length)..-1].split("").all? { |x| x == "\0" }).to be true
    end
  end

  it_behaves_like "packet", 0xbabe01c1, length: 256
end
