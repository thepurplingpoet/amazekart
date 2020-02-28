class OrderMailer < ApplicationMailer
  def email
    @user = params[:user]
    mail(to: @user.email, subject: 'Sample Email')
  end
end
