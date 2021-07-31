class Cost < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :cost_groups
  has_many :groups, through: :cost_groups, source: :group

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  def self.internal
    Cost.reject { |c| c.groups.empty? }
  end

  def self.external
    Cost.select { |c| c.groups.empty? }
  end
end
