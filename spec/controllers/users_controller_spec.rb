require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before { request.headers['CONTENT_TYPE'] = 'application/vnd.api+json' }

  describe '#create' do
    context 'with valid data' do
      let(:user) { User.last }

      before do
        post :create, params: {
          data: {
            attributes: {
              email: 'user@example.com',
              name: 'Example User',
              password: 'password',
              'password-confirmation': 'password'
            },
            type: 'users'
          }
        }
      end

      it 'saves the user' do
        expect(user.email).to eq('user@example.com')
        expect(user.name).to eq('Example User')
        expect(user.authenticate('password')).to be_truthy
      end

      it 'returns created' do
        expect(response.status).to eq(201)
      end

      it 'serializes the user data' do
        expect(JSON.parse(response.body)).to eq({
          'data' => {
            'id' => user.id.to_s,
            'type' => 'users',
            'links' => {
              'self' => 'http://test.host/users/3'
            },
            'attributes' => {
              'email' => 'user@example.com',
              'name' => 'Example User'
            }
          }
        })
      end
    end

    context 'with invalid data' do
      before do
        post :create, params: {
          data: {
            attributes: {
              email: ''
            },
            type: 'users'
          }
        }
      end

      it 'is unsuccessful' do
        expect(response.status).to eq(422)
      end

      it 'does not create a user' do
        expect(User.count).to eq(0)
      end

      it 'serializes the errors' do
        expect(JSON.parse(response.body)).to eq({
          'errors' => [{
            'title' => "can't be blank",
            'detail' => "password - can't be blank",
            'code' => '100',
            'source' => {
              'pointer' => "/data/attributes/password"
            },
            'status' => '422'
          }, {
            'title' => "can't be blank",
            'detail' => "email - can't be blank",
            'code' => '100',
            'source' => {
              'pointer' => "/data/attributes/email"
            },
            'status' => '422'
          }]
        })
      end
    end
  end
end
