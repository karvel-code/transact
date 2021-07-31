require 'rails_helper'

RSpec.describe CostGroup, type: :model do
  it 'should belong to cost' do
    cost_group = CostGroup.reflect_on_association(:cost)
    expect(cost_group.macro).to eq(:belongs_to)
  end

  it 'should belong to cost' do
    group = CostGroup.reflect_on_association(:group)
    expect(group.macro).to eq(:belongs_to)
  end
end
