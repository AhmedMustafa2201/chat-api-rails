class Message < ApplicationRecord
  belongs_to :chat, counter_cache: :messages_count
  before_create :set_message_number

  validates :content, presence: true


  private

  def set_message_number
    max_number = chat.messages.maximum(:number) || 0
    self.number = max_number + 1
  end
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :content, type: :text, analyzer: 'english'
    end
  end

  def as_indexed_json(options = {})
    as_json(only: [:content])
  end
end

# Reindex all existing records
Message.__elasticsearch__.create_index!
Message.import
