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
  end
end
