class Message
  include Mongoid::Document

  attr_accessible :subject, :text

  field :subject, type: String
  field :text, type: String

  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  validates :subject, :text, presence: true
  validate :sender_receiver_not_equal

  private

  def sender_receiver_not_equal
    sender != receiver
  end
end