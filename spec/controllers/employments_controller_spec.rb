# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmploymentsController do
  let!(:employment) { create(:employment) }
  subject { post(:create, params: { employment: params }) }

  describe 'GET #index' do
    it 'assigns @employments' do
      get :index
      expect(assigns(:employments)).to eq([employment])
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'when params are valid' do
      let(:params) do
        {
          employer: employment.employer,
          start_date: employment.start_date,
          end_date: employment.end_date
        }
      end
      it 'create a new employment' do
        expect { subject }.to change(Employment, :count).by(1)
        subject
        expect(response.status).to eq(302)
      end
    end

    context 'when employer is nil' do
      let(:params) do
        {
          employer: nil,
          start_date: employment.start_date,
          end_date: employment.end_date
        }
      end
      it 'does not create a new employment' do
        subject
        expect(response.status).to eq(422)
        expect { subject }.to change(Employment, :count).by(0)
      end
    end

    context 'when start date is nil' do
      let(:params) do
        {
          employer: employment.employer,
          start_date: nil,
          end_date: employment.end_date
        }
      end
      it 'does not create a new employment' do
        subject
        expect(response.status).to eq(422)
        expect { subject }.to change(Employment, :count).by(0)
      end
    end

    context 'when end date is nil' do
      let(:params) do
        {
          employer: employment.employer,
          start_date: employment.start_date,
          end_date: nil
        }
      end
      it 'does not create a new employment' do
        subject
        expect(response.status).to eq(422)
        expect { subject }.to change(Employment, :count).by(0)
      end
    end
  end

  describe 'PUT #update' do
    let(:params) do
      {
        employer: 'Anything'
      }
    end
    it 'should update employment info' do
      put :update, params: { id: employment.id, employment: params }
      employment.reload
      params.each_key do |key|
        expect(employment.attributes[key.to_s]).to eq params[key]
        expect(response.status).to eq(302)
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
