require "ps2/client/packets/open"
require "support/packet_examples"

RSpec.describe PS2::Client::Packets::Open do
  subject(:instance) { described_class.new(pathname, *flags) }
  let(:pathname) { "test.elf" }
  let(:flags) { %i[read] }

  shared_examples_for "body" do
    context "when flags is 1" do
      let(:flags) { tc.flags }

      it "has correct contents" do
        expect(subject[0..3].unpack1("N")).to eq 1
        expect(subject[4..11]).to eq "test.elf"
        expect(subject[12..-1].split("").all? { |x| x == "\0" }).to be true
      end

      it "has correct length" do
        expect(subject.length).to eq 4 + 256
      end
    end
  end

  it_behaves_like "packet", 0xbabe0111, length: 4 + 266
end
