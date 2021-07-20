class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :username, presence:true, length: {minimum: 3, maximum: 25 }
         validates_uniqueness_of: name
     
         has_many :costs, foreign_key: :author_id, dependent: :destroy
         has_many :groups, foreign_key: :author_id
end
