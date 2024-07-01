class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages, dependent: :destroy

  before_create :set_chat_number

  validates :number, uniqueness: { scope: :application_id }

  private

  def set_chat_number
    self.number = application.chats.count + 1
  end
end
