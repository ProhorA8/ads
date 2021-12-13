require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_for_oauth' do
    # Создаём объект :access_token
    # В него записываем те данные, которые мы доставали из хеша
    let(:access_token) do
      double(
        :access_token,
        provider: 'facebook',
        info: double(email: 'procustom4@gmail.com', name: 'evgeniy'),
        extra: double(raw_info: double(id: '10213477015136709'))
      )
    end

    # Ситуация: пользователь не найден
    context 'when user is not found' do
      it 'returns newly created user' do
        user = User.find_for_facebook_oauth(access_token)

        expect(user).to be_persisted
        expect(user.email).to eq 'procustom4@gmail.com'
      end
    end

    # Ситуация: юзер найден по почте
    context 'when user is found by email' do
      let!(:existing_user) { create(:user, email: 'procustom4@gmail.com') }
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_facebook_oauth(access_token)).to eq existing_user
      end
    end

    # Ситуация: юзер найден по провайдеру и урлу
    context 'when user is found by provider + url' do
      let!(:existing_user) do
        create(:user, provider: 'facebook',
                      url: 'https://facebook.com/10213477015136709')
      end
      let!(:some_other_uer) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_facebook_oauth(access_token)).to eq existing_user
      end
    end
  end
end
