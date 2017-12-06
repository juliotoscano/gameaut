class MessagesController < ApplicationController
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        if @message.content === ""
            @message.content = "Este usuário tem interesse em receber o produto!"
        end
        if @message.valid?
          MessageMailer.new_message(@message).deliver_now
          redirect_to home_index_url, notice: "Your messages has been sent."
        else
          flash[:alert] = "An error occurred while delivering this message."
          render :new
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:name, :email, :content)
    end

end
