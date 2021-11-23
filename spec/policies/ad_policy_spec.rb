require 'rails_helper'

RSpec.describe AdPolicy, type: :policy do
  let(:user) { User.new }

  # объект тестирования (политика)
  subject { AdPolicy }

  permissions :create? do
    it { is_expected.to permit(user, Ad) }
    it { is_expected.not_to permit(nil, Ad) }
  end
end
