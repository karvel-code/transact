class Cost < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :cost_groups
  has_many :groups, through: :cost_groups

  validates :name, presence: true, length: { minimum: 3, maximun: 25 }
end
