require 'rails_helper'

describe UserCreator do
  let(:shorten) { double(short_url: "http://bit.ly/123") }

  before do
    allow(Bitly).to receive_message_chain(:client, :shorten)
    .with("http://example.com").and_return(shorten)
  end

  context "with valid params" do
    let(:valid_params) { { name: "John", url: "http://example.com" } }

    subject { described_class.new(valid_params) }

    it "creates a user" do
      expect { subject.create }.to change { User.count }.by(1)
      expect(subject.errors).to be_empty
    end
  end

  context "with invalid params" do
    let(:invalid_params) { { name: nil, url: nil } }

    subject { described_class.new(invalid_params) }

    it "doesn't create a user" do
      expect { subject.create }.not_to change { User.count }.from(0)
      expect(subject.errors).not_to be_empty
    end
  end
end
