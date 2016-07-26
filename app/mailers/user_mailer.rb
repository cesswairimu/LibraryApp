class UserMailer < ApplicationMailer

  
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account Activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end
  def release_book(user)
    @user = user
    mail to: user.email, subject:   "Book Release"
  end

  def book_return(user)
    @user = user
    mail to: user.email, subject:   "Book Return"
  end

end
