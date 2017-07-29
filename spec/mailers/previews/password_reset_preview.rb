# Preview all emails at http://localhost:3000/rails/mailers/password_reset
class PasswordResetPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/password_reset/reset_password
  def reset_password
    PasswordResetMailer.reset_password
  end

end
