class UsersController < ApplicationController
  def new #新規登録メソッド
    @user = User.new
    admin_role_name = '事務局'
    @roles = Role.where.not(name: admin_role_name)
  end

  # 登録画面の作成
  def create
    @user = User.new(user_params)
    @user.save
    full_name = "#{@user.last_name} #{@user.first_name}"
    redirect_to users_url, notice: "タスク 「#{full_name}」を登録しました。 "
  end

  def show
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    #user = User.find(params[:id])
    #if user_id == current_user.id
    # user.destroy #destroyメソッドを使用し対象のツイートを削除する。
    #end

    # 1. 削除対象のユーザーを取得
    user = User.find(params[:id])

    # 2. 権限チェック
    # ログインユーザーが管理者であるか（例: current_user.admin?）
    # かつ、自分自身を削除しようとしていないか（user.id != current_user.id）をチェック
    #
    # 注意: 権限チェックのメソッドは、あなたのアプリの実装に合わせて変更してください
    # if current_user.admin? && user.id != current_user.id
    # 3. 権限があれば削除を実行
    user.destroy
    deleted_user_name = "#{user.last_name} #{user.first_name}"
    redirect_to users_path, notice: "#{deleted_user_name} さんのアカウントを削除しました。"

    # 4. 管理者だが自分自身を削除しようとした場合（オプション）
    #elsif user.id == current_user.id
    # redirect_to user_path(user), alert: "管理者であっても自分自身のアカウントは削除できません。"

    # 5. 管理者権限がない場合
    #else
    # 権限がない場合はアクセスを拒否
    # redirect_to root_path, alert: "この操作を実行する権限がありません。"
    #end

  end

  def index
    @users = User.all
  end

  private



  def user_params
    # 1. 許可する基本属性を定義する
    permitted_attributes = [
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :email,
      :password, # password_confirmation があれば追加
      :gender,
      :phone_mobile,
      :phone_emergency,
      :phone_home,
      :emergency_contact_name,
      :emergency_contact_relationship,
      :address,
      :role_id,

      # 分割された日付入力を許可する
      :"date_of_birth(1i)",
      :"date_of_birth(2i)",
      :"date_of_birth(3i)",

      # admin_attributes のような「常に許可する」属性のネストを最初に追加
      admin_attributes: [:id, :employee_number, :years_of_service, :date_of_hire, :date_of_retirement, :previous_job, :education, :is_on_leave, :employment_type_id]
    ]

    # 2. role_id を取得し、それに基づいてネストされた属性を追加する
    # params[:user]が存在し、role_idが取得可能であることを前提
    role_id = params[:user][:role_id].to_i if params[:user].present? && params[:user][:role_id].present?

    if role_id == 2 # 例: 教師 (Teacher) の role_id
      permitted_attributes << { teacher_attributes: [
        :id, :employee_number, :faculty_name,  :department_name, :years_of_service, :date_of_hire, :education, :employment_type,
      :previous_job, :is_on_leave
      ]}
    elsif role_id == 1 # 例: 学生 (Student) の role_id
      permitted_attributes << { student_attributes: [
        :id, :student_number, :grade_level, :parent_name, :relationship,
        :date_of_admission, :date_of_separation, :is_graduated
      ]}
    end

    # 3. 最後に、すべての許可された属性で permit を一度だけ実行し、その結果を返す
    params.require(:user).permit(*permitted_attributes)
  end
end
