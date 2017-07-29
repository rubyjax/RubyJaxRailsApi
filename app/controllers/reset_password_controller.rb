class ResetPasswordController < ApplicationController
  def create
    PasswordResetMailer.reset_password.deliver
    render json: {message: "email sent"}, status: :accepted
  end
end
