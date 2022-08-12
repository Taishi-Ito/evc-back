class UsersController < ApplicationController
  skip_before_action :authenticate_user
  before_action :check_auth
  def create
    user = User.new(user_params.merge("uid": payload['sub']))
    if user.valid?
      user.save
      render json: {"name": user.name, "locale": user.locale}, status: 200
    else
      render json: {"name": nil, "locale": nil}, status: 400
    end
  end

  def destroy
    user = User.find_by(uid: params["uid"])
    begin
      user.destroy
      render json: {is_destroy: true}, status: 200
    rescue => exception
      render json: {is_destroy: false, error_message: exception}, status: 400
    end
  end

  def show
    user = User.find_by(uid: params["id"])
    if user
      if user.name
        render json: {"is_user": true, "is_name": true, "name": user.name, "locale": user.locale}
      else
        render json: {"is_user": true, "is_name": false, "name": user.name, "locale": user.locale}
      end
    else
      render json: {"is_user": false, "is_name": false}
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
