require 'rails_helper'

RSpec.describe Group, type: :model do
    it 'should have zero or many costs' do
        first_group = Group.reflect_on_association(:costs)
        expect(first_group.macro).to eq(:has_many)
    end  

end