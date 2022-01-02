class MessagesController < ApplicationController
	before_action :require_user

   def create
   	# build function will generate the associations between current user and message
     message = current_user.messages.build(message_params)
     if message.save
     	# whatever passed in the place of foo can be receive at chatroom.coffee's reciever method
     	ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)                              
     end
   end 

   private

   def message_params
   	params.require(:message).permit(:body)
   end 

   def message_render(message)
     render(partial: "message", locals: {message: message })
   end 

end 