class ChatsController < ApplicationController
    # before_action :set_application
  
    def create
      ChatCreationJob.perform_async(params[:application_token])
      render json: { status: 'Chat creation queued' }, status: :accepted
    end
  
    private
  
    # def set_application
    #   @application = Application.find_by!(token: params[:application_token])
    # end
end
  