require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: 'elvis', email: 'elvis@gmail.com', password: 'elvis123') }
  let(:invalid_user) { User.create(username: '') }


#   it 'creates user correctly' do
#     @user = User.create(username: 'elvis', email: 'elvis@gmail.com', password: 'elvis123')
#     expect(@user.valid?).to be true
#   end

  it 'user must have email' do
    @user = User.create(username: 'elvis', password: 'elvis123')
    expect(@user.valid?).to be false
  end

  it 'user must have password' do
    @user = User.create(username: 'elvis', email: 'elvis@gmail.com')
    expect(@user.valid?).to be false
  end
end
