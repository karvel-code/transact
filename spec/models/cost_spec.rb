require 'rails_helper'

RSpec.describe Cost, type: :model do
  let(:user) { User.create(username: 'shaher', email: 'elvis@gmail.com', password: 'elvis123', id: 1) }
  let(:group) { Group.create(name: 'group', author_id: user.id) }
  let(:cost) { Cost.create(name: 'string', amount: 12, author_id: user.id) }

  it 'should be valid with valid attributes' do
    expect(cost).to be_valid
  end

  it 'should be not valid without a name' do
    cost.name = ''
    expect(cost).to_not be_valid
  end

  it 'should be not valid without a user' do
    cost.author_id = nil
    expect(cost).to_not be_valid
  end

  it 'should check the correct association between user and expense' do
    user.costs.should include(cost)
  end

  it 'should have zero or many groups' do
    cost = Cost.reflect_on_association(:groups)
    expect(cost.macro).to eq(:has_many)
  end
end
