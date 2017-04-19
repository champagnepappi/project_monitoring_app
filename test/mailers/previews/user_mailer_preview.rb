# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first || Lecturer.first
    user.activation_token = User.new_token || Lecturer.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first || Lecturer.first
    user.reset_token = User.new_token || Lecturer.new_token
    UserMailer.password_reset(user)
  end

  def lec_activation
    lec = Lecturer.first
    lec.reset_token = Lecturer.new_token
    UserMailer.lec_activation(lec)
  end

end
