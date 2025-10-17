class User < ApplicationRecord
  has_secure_password
  has_one :admin
  has_one :teacher
  has_one :student
  has_many :leaves
  belongs_to :role
end
