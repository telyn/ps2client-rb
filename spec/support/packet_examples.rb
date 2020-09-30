# frozen_string_literal: true

RSpec.shared_examples_for "packet" do |type, empty_body: false, length: nil|
  describe "#body" do
    subject { instance.body }

    if empty_body
      it { is_expected.to be nil }
    else
      include_examples "body"
    end
  end

  describe "#magic" do
    subject { instance.magic }

    it { is_expected.to eq type }
  end

  describe "#serialize" do
    subject { instance.serialize }

    it "has correct type" do
      expect(subject[0..3].unpack1("N")).to eq type
    end

    it "has correct length" do
      expect(subject[4..5].unpack1("n")).to eq subject.length
    end

    it "has correct encoding" do
      expect(subject.encoding.to_s).to eq "ASCII-8BIT"
    end

    describe "body" do
      subject { instance.serialize[6..-1] }

      if empty_body
        it { is_expected.to be_empty }
      else
        include_examples "body"
      end
    end
  end
end
