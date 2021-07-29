class Cost < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :cost_groups
  has_many :groups, through: :cost_groups, source: :group

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

#   has_many :cost_groups_a, -> { where group_id: 0 }, class_name: 'CostGroup', foreign_key: 'cost_id'
#   has_many :grouped_costs, through: :

# scope :internal, -> { where('group_id > ?', 0 ) }
# scope :external, -> { where('group_id = ?', nil ) }


def self.internal
  Cost.select{|c|!c.groups.empty?}
end

def self.external
  Cost.select{|c|c.groups.empty?}
end
end
