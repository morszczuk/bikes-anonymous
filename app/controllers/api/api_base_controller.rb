module Api
  class ApiBaseController < ApplicationController
    before_action :authorize!

    private

    def authorize!
      render json: { message: 'You are not authorized!' }, status: :unauthorized unless request.headers['HTTP_AUTHORIZATION_TOKEN'].present?
    end
  end
end
