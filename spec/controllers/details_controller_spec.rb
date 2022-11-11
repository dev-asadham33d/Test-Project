# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DetailsController do
  let!(:detail) { create(:detail) }

  subject { post(:create, params: { detail: params }) }
  describe 'GET#index' do
    it 'assigns @details' do
      get :index
      expect(assigns(:details)).to eq([detail])
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST#create' do
    context 'when params are valid' do
      let(:params) do
        {
          first_name: detail.first_name,
          last_name: detail.last_name,
          email_address: detail.email_address,
          phone_number: detail.phone_number
        }
      end
      it 'create a new detail' do
        expect { subject }.to change(Detail, :count).by(1)
        subject
        expect(response.status).to eq(302)
      end
    end

    context 'when first name is nil' do
      let(:params) do
        {
          first_name: nil,
          last_name: detail.last_name,
          email_address: detail.email_address,
          phone_number: detail.phone_number
        }
      end
      it 'does not create a new detail' do
        subject
        expect(response.status).to eq(422)
        expect { subject }.to change(Detail, :count).by(0)
      end
    end

    context 'when last name is nil' do
      let(:params) do
        {
          first_name: detail.first_name,
          last_name: nil,
          email_address: detail.email_address,
          phone_number: detail.phone_number
        }
      end
      it 'does not create a new detail' do
        subject
        expect(response.status).to eq(422)
        expect { subject }.to change(Detail, :count).by(0)
      end
    end

    context 'when email is not valid' do
      let(:params) do
        {
          first_name: detail.first_name,
          last_name: detail.last_name,
          email_address: 'hamza',
          phone_number: detail.phone_number
        }
      end
      it 'does not create a new detail' do
        subject
        expect(response.status).to eq(422)
        expect { subject }.to change(Detail, :count).by(0)
      end
    end

    context 'when phone nuber is nil' do
      let(:params) do
        {
          first_name: detail.first_name,
          last_name: detail.last_name,
          email_address: detail.email_address,
          phone_number: nil
        }
      end
      it 'does not create a new detail' do
        subject
        expect(response.status).to eq(422)
        expect { subject }.to change(Detail, :count).by(0)
      end
    end
  end

  describe 'PUT #update' do
    let(:params) do
      {
        first_name: 'Hamza',
        last_name: 'Rauf',
        email_address: 'hamza@gmail.com',
        phone_number: '2222222222'
      }
    end
    it 'should update detail info' do
      put :update, params: { id: detail.id, detail: params }
      detail.reload
      params.each_key do |key|
        expect(response.status).to eq(302)
        expect(detail.attributes[key.to_s]).to eq params[key]
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete detail' do
      expect { delete :destroy, params: { id: detail.id } }.to change(Detail, :count).by(-1)
    end
  end
end
