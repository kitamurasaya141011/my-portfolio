class Admin < ApplicationRecord
  belongs_to :user
  belongs_to :employment_type
end
