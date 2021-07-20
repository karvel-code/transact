class Group < ApplicationRecord
    belongs_to :author, class_name: 'User'

    has_many :cost_groups
  
    has_many :cost, through: :cost_groups
end
