class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :baria_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def index
    @user = User.find(current_user.id)
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(current_user.id), notice: "successfully updated user!"
  	else
  		render "edit"
  	end
  end

  # メイラー機能実装するためのアクション
  def create
    @user = User.new(user_params)
    if @user.save #ユーザーのインスタンスが新しく生成されて保存されたら
      NotificationMailer.send_when_signup(@user).deliver #確認メールを送信
      redirect_to user_path(current_user.id)
    else
      render request.referer
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :postcode, :prefecture_name, :address_city, :address_street, :address_building, :latitude, :longitude)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end

end
