require 'rails_helper'

describe HeaderCreator do
  let(:user) { create(:user) }
  subject { described_class.new(user) }

  it "creates headers from a scraped headers" do
    scraped_headers = []
    scraped_headers << double(name: "h1", text: "a title")
    scraped_headers << double(name: "h2", text: "another title")

    allow(subject).to receive(:scraped_headers).and_return(scraped_headers)

    expect { subject.create }.to change { Header.count }.by(2)
  end
end
