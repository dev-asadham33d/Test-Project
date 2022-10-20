# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmploymentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/employments').to route_to('employments#index')
    end

    it 'routes to #show' do
      expect(get: '/employments/1').to route_to('employments#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: '/employments/new').to route_to('employments#new')
    end

    it 'routes to #update via PUT' do
      expect(put: '/employments/1').to route_to('employments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/employments/1').to route_to('employments#update', id: '1')
    end
  end
end
