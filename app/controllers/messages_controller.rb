class MessagesController < ApplicationController
	before_action :require_user

   def create
   	# build function will generate the associations between current user and message
     message = current_user.messages.build(message_params)
     redirect_to root_path if message.save
   end 

   private
   def message_params
   	params.require(:message).permit(:body)
   end 

end 