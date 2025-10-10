class Department < ApplicationRecord
  belongs_to :faculty
  has_many :student_affiliations
end
