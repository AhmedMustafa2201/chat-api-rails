class ChatsController < ApplicationController
    before_action :set_application
  
    def create
      chat = @application.chats.build
      if chat.save
        render json: { number: chat.number }, status: :created
      else
        render json: chat.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_application
      @application = Application.find_by!(token: params[:application_token])
    end
end
  