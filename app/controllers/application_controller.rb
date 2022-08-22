class ApplicationController < ActionController::API
  include Firebase::Auth::Authenticable
  include ErrorRenderable
  before_action :authenticate_user
end
