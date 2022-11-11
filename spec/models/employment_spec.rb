# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employment, type: :model do
  subject { build(:employment) }

  it { should validate_presence_of(:employer) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end
