class User < ApplicationRecord
  has_secure_password
  has_one :admin
  has_one :teacher
  has_one :student
  has_many :leaves
  belongs_to :role

  accepts_nested_attributes_for :admin, allow_destroy: true
  accepts_nested_attributes_for :student, allow_destroy: true
  accepts_nested_attributes_for :teacher, allow_destroy: true
end
