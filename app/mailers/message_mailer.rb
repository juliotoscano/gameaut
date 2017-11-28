class MessageMailer < ApplicationMailer
    default from: ENV["SECRET_EMAIL_BASE"]
    
    def new_message(message)
        @message = message
        mail(:to => @message.email, :subject => "Alguem entrou em contato!") do |format|
            format.text {render 'message_mailer/mailer'}
            format.html {render 'message_mailer/new_message'}
        end
    end
end
