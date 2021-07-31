require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(username: 'elvis', email: 'elvis@gmail.com', password: 'elvis123', password_confirmation: 'elvis123')
  end
  let(:invalid_user) { User.new(username: '') }

  it 'creates user correctly' do
    @user = User.new(username: 'leon', email: 'leon@gmail.com', password: 'leon123', password_confirmation: 'leon123')
    expect(@user.valid?).to be true
  end

  it 'user must have email' do
    @user = User.new(username: 'elvis', password: 'elvis123')
    expect(@user.valid?).to be false
  end

  it 'user must have password' do
    @user = User.new(username: 'elvis', email: 'elvis@gmail.com')
    expect(@user.valid?).to be false
  end
end
