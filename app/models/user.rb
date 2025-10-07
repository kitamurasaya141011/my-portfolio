class User < ApplicationRecord
  has_many :admins, dependent: :destroy

  enum gender: { male: 0, female: 1, other: 2 } #マイグレーションで性別をinteger型で扱ったので数字を決める
end
