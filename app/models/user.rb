class User < ApplicationRecord
  has_many :admins, dependent: :destroy

  enum gender: { male: 0, female: 1, other: 2 } # 3行目
end
