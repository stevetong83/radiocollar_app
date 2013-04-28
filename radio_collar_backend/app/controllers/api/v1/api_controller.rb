class Api::V1::ApiController < ApplicationController
  respond_to :json
  before_filter :verify_user

  def verify_user
    @user = User.where(authentication_token: params[:authentication_token]).first
    if @user.nil?
      render json: { errors: "User must be logged in" }, success: false, status: 420
    end
  end
end
