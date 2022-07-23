module Api
  module V1
    class HelloController < ApplicationController
      def index
        msessage = params["message"]
        render json: msessage
      end
    end
  end
end
