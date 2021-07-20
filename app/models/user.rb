class User < ApplicationRecord
    validates :username, presence:true, length: {minimum: 3, maximum: 25 }
    validates_uniqueness_of: name
end
