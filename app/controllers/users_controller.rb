class UsersController < ApplicationController
  def new #新規登録メソッド
    @user = User.new
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

  def delete
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :email,
      # データベースには password_digest だが、フォームからは password と password_confirmation を受け取る
      :password,
      #:password_confirmation,
      :gender,
      :phone_mobile,
      :phone_emergency,
      :phone_home,
      :emergency_contact_name,
      :emergency_contact_relationship,
      :address,
      :date_of_birth,
      :role_id
    )
  end
end
