# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Detail, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.first_name = 'Anything'
    subject.last_name = 'Anything'
    subject.email_address = Faker::Internet.email
    subject.phone_number = '1111111111'
    expect(subject).to be_valid
  end

  it 'is not valid without first name' do
    detail = Detail.new(first_name: nil)
    expect(detail).to_not be_valid
  end

  it 'is not valid without last name' do
    detail = Detail.new(last_name: nil)
    expect(detail).to_not be_valid
  end

  it 'is not valid without email address' do
    detail = Detail.new(email_address: nil)
    expect(detail).to_not be_valid
  end

  it 'is not valid without phone  number' do
    detail = Detail.new(phone_number: nil)
    expect(detail).to_not be_valid
  end
end
