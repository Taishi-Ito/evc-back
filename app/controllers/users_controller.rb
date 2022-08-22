class UsersController < ApplicationController
  skip_before_action :authenticate_user
  before_action :check_auth
  def create
    user = User.new(user_params.merge("uid": payload['sub']))
    if user.valid?
      user.save
      render json: {"name": user.name, "locale": user.locale}, status: 201
    else
      render json: {message: "送信した値が不正です。"}, status: 400
    end
  end

  def destroy
    user = User.find_by(uid: params["uid"])
    user.destroy
    render json: {is_destroy: true}, status: 204
  end

  def show
    user = User.find_by(uid: params["id"])
    if user && user.name
      render json: {"name": user.name, "locale": user.locale}, status: 200
    else
      render json: {message: "ユーザーが見つかりません。"}, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :locale)
  end

  def check_auth
    raise ArgumentError, 'BadRequest Parameter' if payload.blank?
  end

  def token_from_request_headers
    request.headers['Authorization']&.split&.last
  end

  def token
    params[:token] || token_from_request_headers
  end

  def payload
    @payload ||= FirebaseIdToken::Signature.verify token
  end
end
