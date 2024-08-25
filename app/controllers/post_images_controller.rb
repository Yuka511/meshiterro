class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end
  
  def destroy
    post_image = PostImage.find(params[:id]) #削除するPostImageレコードを1件取得
    post_image.destroy #データ（レコード）を削除
    redirect_to '/post_images' #投稿一覧画面へリダイレクト
  end
  
  # 投稿データのストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
