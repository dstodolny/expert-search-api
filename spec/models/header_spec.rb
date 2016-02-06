require 'rails_helper'

describe Header do
  subject { build(:header) }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:importance) }
  it { is_expected.to respond_to(:content) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:importance) }
  it { is_expected.to validate_presence_of(:content) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to define_enum_for(:importance).with([:h1, :h2, :h3]) }
end
