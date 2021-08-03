class Cost < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :cost_groups
  has_many :groups, through: :cost_groups, source: :group

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  validates_numericality_of :amount, greater_than: 0, allow_nil: false

  def self.internal
    Cost.select { |c| c.groups.any? }
  end

  def self.external
    Cost.select { |c| c.groups.empty? }
  end

  def self.external_total
    sum = 0
    Cost.external.each do |cost|
      sum += cost.amount
    end
    sum
  end

  def self.internal_total
    sum = 0
    Cost.internal.each do |cost|
      sum += cost.amount
    end
    sum
  end
end
