class Student < ApplicationRecord
  belongs_to :user
  has_many :student_affiliations
end
