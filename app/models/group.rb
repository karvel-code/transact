class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :cost_groups, dependent: :destroy

  has_many :costs, through: :cost_groups, source: :cost

  has_one_attached :image

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
end
