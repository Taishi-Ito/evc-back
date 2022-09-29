module ErrorRenderable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: {message: e}, status: 404
    end
    rescue_from ArgumentError do |e|
      render json: {message: e}, status: 404
    end
    rescue_from ActiveRecord::RecordNotDestroyed do |e|
      render json: {message: e}, status: 400
    end
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: {message: "入力値を確認してください。<br> #{e}"}, status: 422
    end
    rescue_from ActiveRecord::RangeError do |e|
      render json: {message: "年は最長4桁の整数、単位が%のものは最長3桁+小数点3桁の数字、それ以外は最長16桁+小数点3桁の数字の範囲で入力してください。"}, status: 400
    end
  end
end
