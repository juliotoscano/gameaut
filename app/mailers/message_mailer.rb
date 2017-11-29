class MessageMailer < ApplicationMailer
    default from: ENV["SECRET_EMAIL_BASE"]
    def new_message(message)
        @message = message
        mail(:to => ENV["SECRET_EMAIL_BASE"], :reply_to => @message.email , :subject => "Usuario entrou em contato: #{@message.email}") do |format|
            format.text {render 'message_mailer/mailer'}
            format.html {render 'message_mailer/new_message'}
        end
    end
end
