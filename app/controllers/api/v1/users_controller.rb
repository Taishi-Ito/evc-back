class Api::V1::UsersController < ApplicationController

  def create
    user = Api::V1::User.new(user_params)
    if user.valid?
      user.save
      render json: {"name": user.name, "locale": user.locale}, status: 200
    else
      render json: {"name": nil, "locale": nil}, status: 200
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
    params.require(:user).permit(:name, :uid, :locale)
  end
end
