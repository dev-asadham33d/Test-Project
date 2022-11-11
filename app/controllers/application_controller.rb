# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotUnique do |e|
    render json: { errors: e.record.errors }, status: :dublicate_entity
  end

  rescue_from ActiveRecord::RecordNotSaved do |e|
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end
end
