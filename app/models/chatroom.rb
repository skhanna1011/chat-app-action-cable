class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, uniqueness: true
  before_validation :sanitize, :slugify

  def to_param
    self.slug
  end

  def sanitize
    self.topic = self.topic.strip
  end

  def slugify
    self.slug = self.topic.downcase.gsub(" ","-")
  end

end