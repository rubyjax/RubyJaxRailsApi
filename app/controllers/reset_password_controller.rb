class ResetPasswordController < ApplicationController
  def create
    render json: {message: "email sent"}, status: :accepted
  end
end
