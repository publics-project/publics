class Message
  include Mongoid::Document

  attr_accessible :subject, :text, :receiver_id

  field :subject, type: String
  field :text, type: String

  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  validates :subject, :text, :sender, :receiver, presence: true
  validate :sender_receiver_not_equal

  private

  def sender_receiver_not_equal
    if sender == receiver
      errors.add(:receiver, "receiver can't be same to sender")
    end
  end
end