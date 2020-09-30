require "ps2/client/packets/open_reply"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::OpenReply do
  subject(:instance) { described_class.new(result) }
  let(:result) { fake_int32 }

  shared_examples_for "body" do

    it "has correct contents" do
      expect(subject[0..3].unpack1("N")).to eq result
    end
  end

  it_behaves_like "packet", 0xbabe0112
end
