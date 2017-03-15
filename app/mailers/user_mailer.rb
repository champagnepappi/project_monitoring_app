class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user= user

    mail to: user.email, subject: "Account Activation"
  end

  def password_reset(user)
    @user = user

    mail to: user.email, subject: "Password reset"
  end

  def project_approval(user)
    @user = user
    mail to: user.email, subject: "Project Approval"
  end

  def project_rejection(user)
    @user = user
    mail to: user.email, subject: "Project rejection"
  end
end
