# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Detail, type: :model do
  subject { build(:detail) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email_address) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:phone_number) }
end
