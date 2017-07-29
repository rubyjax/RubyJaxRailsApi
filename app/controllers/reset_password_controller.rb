class ResetPasswordController < ApplicationController
  def create
    render json: {message: "email sent"}, status: 202
  end
end
