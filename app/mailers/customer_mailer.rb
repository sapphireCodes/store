class CustomerMailer < ApplicationMailer
    default from: 'sapphire230686@gmail.com'

    def welcome_email
      @customer = params[:customer]
      @url  = 'http://127.0.0.1:3000/login'
      mail(to: @customer.email, subject: 'Welcome to our store!')
    end
end
