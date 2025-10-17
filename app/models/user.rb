class User < ApplicationRecord
  has_secure_password
  has_one :admin, dependent: :destroy
  has_one :teacher, dependent: :destroy
  has_one :student, dependent: :destroy
  has_many :leaves
  belongs_to :role

  accepts_nested_attributes_for :admin, allow_destroy: true
  accepts_nested_attributes_for :student, allow_destroy: true
  accepts_nested_attributes_for :teacher, allow_destroy: true

  # 定数として性別のマッピングを定義
  GENDERS = { 0 => '未設定', 1 => '男性', 2 => '女性', 3 => 'その他' }.freeze

  # インスタンスメソッドとして表示名を取得する
  def gender_label
    GENDERS.fetch(self.gender.to_i, '不明')
  end

  # roleを使用する方法がうまくいかなかったのでフォームで種別を保持するための仮想属性を作る
  attr_accessor :user_type

  # 学生の必須フィールド（例: student_id）に条件付きバリデーションを適用
  validates :student_id, presence: true, if: :student_selected?
  # これが「required: true」の代わりとして機能します。

  # フォームで送信された値に基づいて学生が選択されているかを判定するメソッド
  def student_selected?
    # user_type カラム/属性があり、'student' が選択されている場合に true を返す
    self.user_type == 'student'
  end

  # ※ 先生側のフィールドにも同様に設定することが望ましいです
  validates :teacher_license_no, presence: true, if: -> { user_type == 'teacher' }
end
