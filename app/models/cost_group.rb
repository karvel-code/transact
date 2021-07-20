class CostGroup < ApplicationRecord
    belongs_to :expense
    belongs_to :group
end
