class ChatCreationJob
  include Sidekiq::Job
  
  def perform(application_token)
    Rails.logger.info "Enqueuing chat creation job for application token: #{application_token}"

    application = Application.find_by(token: application_token)
    return unless application

    Chat.transaction do
      chat_number = (application.chats.maximum(:number) || 0) + 1
      application.chats.create!(number: chat_number)
    end
  end
end
