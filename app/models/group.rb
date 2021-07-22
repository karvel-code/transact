class Group < ApplicationRecord
    belongs_to :author, class_name: 'User'

    has_many :cost_groups
  
    has_many :costs, through: :cost_groups

    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
end
