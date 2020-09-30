require 'rails_helper'

RSpec.describe HomeController do
  describe '#index' do
    it 'renders the index template' do
      get :index, params: { user_id: 1 }
      expect(response).to render_template(:index)
    end

    it 'raise error when user_id is absent' do
      expect { get(:index, {}) }.to raise_error(ActionController::ParameterMissing)
    end

    context 'when db is fill' do
      before(:all) do
        FactoryBot.create_list(:user, 3)
        FactoryBot.create_list(:tag, 10)
        FactoryBot.create_list(:company, 10, :with_tags_and_persons)
      end

      it 'returns no records when user not exist' do
        get :index, params: { user_id: -23 }
        expect(assigns(:companies).size).to eq(0)
      end

      context 'when request with exist id' do
        let(:user_id) { User.first.id }

        it 'returns companies' do
          get :index, params: { user_id: user_id }
          expect(assigns(:companies).size).not_to eq(0)
        end

        it 'returns 5 company tags' do
          get :index, params: { user_id: user_id }
          expect(assigns(:companies).first.tags.size).to eq(5)
        end

        it 'returns company contacts count' do
          get :index, params: { user_id: user_id }
          expect(assigns(:companies).first.contacts.size).to be_kind_of(Integer)
        end
      end
    end
  end
end
