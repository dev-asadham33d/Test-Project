# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmploymentsController do
  let!(:employment) { create(:employment) }
  describe 'GET #index' do
    it 'assigns @employments' do
      get :index
      expect(assigns(:employments)).to eq([employment])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'when params are valid' do
      it 'create a new employment' do
        params = {
          employer: employment.employer,
          start_date: employment.start_date,
          end_date: employment.end_date
        }
        expect { post(:create, params: { employment: params }) }.to change(Employment, :count).by(1)
      end
    end

    context 'when employer is nil' do
      it 'does not create a new employment' do
        params = {
          employer: nil,
          start_date: employment.start_date,
          end_date: employment.end_date
        }
        expect { post(:create, params: { employment: params }) }.to change(Employment, :count).by(0)
      end
    end

    context 'when start date is nil' do
      it 'does not create a new employment' do
        params = {
          employer: employment.employer,
          start_date: nil,
          end_date: employment.end_date
        }
        expect { post(:create, params: { employment: params }) }.to change(Employment, :count).by(0)
      end
    end

    context 'when end date is nil' do
      it 'does not create a new employment' do
        params = {
          employer: employment.employer,
          start_date: employment.start_date,
          end_date: nil
        }
        expect { post(:create, params: { employment: params }) }.to change(Employment, :count).by(0)
      end
    end
  end

  describe 'PUT #update' do
    it 'should update employment info' do
      params = {
        employer: 'Anything'
      }

      put :update, params: { id: employment.id, employment: params }
      employment.reload
      params.each_key do |key|
        expect(employment.attributes[key.to_s]).to eq params[key]
        expect(flash[:notice]).to eq 'Employment was successfully updated.'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete employment' do
      expect { delete :destroy, params: { id: employment.id } }.to change(Employment, :count).by(-1)
    end
  end
end
