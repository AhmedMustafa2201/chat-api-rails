class Message < ApplicationRecord
  belongs_to :chat

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
