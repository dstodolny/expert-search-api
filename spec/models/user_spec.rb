require 'rails_helper'

describe User do
  subject { build(:user) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to validate_presence_of(:name) }
end