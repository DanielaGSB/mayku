require 'rails_helper'

RSpec.describe Mould, type: :model do
  it { is_expected.to validate_presence_of :image }
end
