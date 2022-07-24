class Api::V1::UsersController < ApplicationController

  def create
    user = Api::V1::User.new(user_params)
    begin
      user.save
      render status: 200

    rescue => exception
      render json: {error_message: exception}
    end
  end

  def get_user
    user = Api::V1::User.find_by(uid: params["uid"])
    if user
      render json: {"name": user.name, "locale": user.locale}, status: 200
    else
      render status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :uid, :locale)
  end
end
