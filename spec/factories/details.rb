# frozen_string_literal: true

FactoryBot.define do
  factory :detail do
    first_name { 'John' }
    last_name  { 'Doe' }
    nick_name { 'optional' }
    email_address { Faker::Internet.email }
    phone_number { '1111111111' }
  end
end
