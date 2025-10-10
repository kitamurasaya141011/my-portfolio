class User < ApplicationRecord
  has_many :admins
  belongs_to :role
end
