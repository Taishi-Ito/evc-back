class UsersController < ApplicationController
  def create
    user = User.new(user_params)
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
      render json: {is_destroy: true}
    rescue => exception
      render json: {is_destroy: false, error_message: exception}
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
    params.require(:user).permit(:name, :uid, :locale)
  end
end
