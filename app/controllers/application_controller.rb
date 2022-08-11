class ApplicationController < ActionController::API
  include Firebase::Auth::Authenticable
  before_action :check_auth
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
