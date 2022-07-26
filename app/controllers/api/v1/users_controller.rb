class Api::V1::UsersController < ApplicationController

  def create
    user = Api::V1::User.new(user_params)
    begin
      user.save
      render json: {"name": user.name, "locale": user.locale}, status: 200
    rescue => exception
      render json: {error_message: exception}
    end
  end

  def destroy
    user = Api::V1::User.find_by(uid: params["uid"])
    begin
      user.destroy
      render json: {is_destroy: true}
    rescue => exception
      render json: {is_destroy: false, error_message: exception}
    end
  end

  def get_user
    user = Api::V1::User.find_by(uid: params["uid"])
    if user
      render json: {"is_name": true, "name": user.name, "locale": user.locale}
    else
      render json: {"is_name": false}
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :uid, :locale)
  end
end
