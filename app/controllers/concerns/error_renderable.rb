module ErrorRenderable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: {message: "レコードが見つかりません。"}, status: 404
    end
    rescue_from ArgumentError do |e|
      render json: {message: "入力値が不正です。"}, status: 404
    end
  end
end
