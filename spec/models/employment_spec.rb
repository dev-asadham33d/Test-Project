# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employment, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.employer = 'Anything'
    subject.start_date = DateTime.now
    subject.end_date = DateTime.now + 1.day
    expect(subject).to be_valid
  end

  it 'is not valid without first name' do
    employment = Employment.new(employer: nil)
    expect(employment).to_not be_valid
  end

  it 'is not valid without last name' do
    employment = Employment.new(start_date: nil)
    expect(employment).to_not be_valid
  end

  it 'is not valid without email address' do
    employment = Employment.new(end_date: nil)
    expect(employment).to_not be_valid
  end
end
