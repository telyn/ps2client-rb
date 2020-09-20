require "ps2/client/packets/execiop"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::ExecIOP do
  subject(:instance) { described_class.new(*argv) }
  let(:argv) { ["test.elf"] }

  shared_examples_for "body" do
    it "has correct contents" do
      expect(subject[0..3].unpack1("N")).to eq 1
      expect(subject[4..12]).to eq "test.elf\0"
      expect(subject[13..-1].split("").all? { |x| x == "\0" }).to be true
    end

    it "is correct length" do
      expect(subject.length).to eq 260
    end
  end

  it_behaves_like "packet", 0xbabe0202
end
