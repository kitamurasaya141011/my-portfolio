class StudentAffiliation < ApplicationRecord
  belongs_to :student
  belongs_to :department
end
