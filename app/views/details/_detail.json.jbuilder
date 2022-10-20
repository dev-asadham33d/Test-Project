# frozen_string_literal: true

json.extract! detail, :id, :first_name, :last_name, :nick_name, :email_address, :phone_number, :created_at, :updated_at
json.url detail_url(detail, format: :json)
