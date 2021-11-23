require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  # let(:user) { User.new }
  #
  # subject { described_class }
  #
  # context 'when user owns his account' do
  #   permissions :show? do
  #     it { is_expected.to permit(user, user) }
  #   end
  # end
  #
  # context 'when user is admin' do
  # let(:admin) { User.new(admin: true) }
  #
  # permissions :show? do
  #   it { is_expected.to permit(admin, user) }
  # end
  # end

  # context 'when user is not admin' do
  #   let(:simple_user) { User.new }
  #
  #   permissions :show? do
  #     it { is_expected.not_to permit(simple_user, user) }
  #   end
  # end
  #
  # context 'when user is anonymous' do
  #   permissions :show? do
  #     it { is_expected.not_to permit(nil, user) }
  #   end
  # end
end
