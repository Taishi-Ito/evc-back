module ErrorRenderable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: {message: "レコードが見つかりません"}, status: 404
    end
  end
end
