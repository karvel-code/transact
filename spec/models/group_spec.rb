require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user1) { User.create(username: 'elvis', email: 'elvis@gmail.com', password: 'elvis123') }

  context 'validation test' do
    it 'is not valid without valid params' do
      group1 = Group.new
      expect(group1.valid?).to be false
    end

    it 'group must have a name' do
      @group = Group.new(name: '', author_id: user1.id)
      expect(@group.valid?).to be false
    end

    it 'group must have an author id' do
      @group = Group.new(name: 'taxes', author_id: nil)
      expect(@group.valid?).to be false
    end
  end

  context 'association test' do
    it 'should have zero or many costs' do
      first_group = Group.reflect_on_association(:costs)
      expect(first_group.macro).to eq(:has_many)
    end
  end
end
