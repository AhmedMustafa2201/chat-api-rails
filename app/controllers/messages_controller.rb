class MessagesController < ApplicationController
  before_action :set_application
  before_action :set_chat

  def create
    MessageCreationJob.perform_async(@application.token, @chat.number, params[:content])
    render json: { status: 'Message creation queued' }, status: :accepted
  end

  def search
    query = params[:query]
    results = @chat.messages.search(query: {
      multi_match: {
        query: query,
        fields: [:content]
      }
    }).records

    render json: results
  end

  private

  def set_application
    @application = Application.find_by!(token: params[:application_token])
  end

  def set_chat
    @chat = @application.chats.find_by!(number: params[:chat_number])
  end

  # def message_params
  #   params.require(:message).permit(:content)
  # end
end
  