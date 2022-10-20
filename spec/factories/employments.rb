# frozen_string_literal: true

FactoryBot.define do
  factory :employment do
    employer { 'John' }
    start_date { DateTime.now }
    end_date { DateTime.now + 1.day }
  end
end
