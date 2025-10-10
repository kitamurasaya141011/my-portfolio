class User < ApplicationRecord
  has_secure_password
  has_many :admins
  has_many :teachers
  has_many :students
  has_many :leaves
  belongs_to :role
end
