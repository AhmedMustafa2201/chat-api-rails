class UpdateCountsJob
  include Sidekiq::Job

  def perform(*args)
    update_application_counts
    update_chat_counts
  end

  private

  def update_application_counts
    Application.find_each do |application|
      application.update(chats_count: application.chats.count)
    end
  end

  def update_chat_counts
    Chat.find_each do |chat|
      chat.update(messages_count: chat.messages.count)
    end
  end

end

