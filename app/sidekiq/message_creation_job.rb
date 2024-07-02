class MessageCreationJob
  include Sidekiq::Job

  def perform(application_token, chat_number, message_content)
    application = Application.find_by(token: application_token)
    return unless application

    chat = application.chats.find_by(number: chat_number)
    return unless chat

    Message.transaction do
      message_number = (chat.messages.maximum(:number) || 0) + 1
      chat.messages.create!(number: message_number, content: message_content)
    end
  end
end
