class UsersController < ApplicationController
  def new

  end

  # 登録画面の作成
  def create
    user = User.new(user_params)
    user.save!
    redirect_to users_url, notice: "タスク 「#{user.name}」を登録しました。 "
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
end
