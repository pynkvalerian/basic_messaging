class User < ActiveRecord::Base
  has_secure_password

  has_many :proposals
  has_many :sent_messages, class_name: 'Message', as: :messageable
  has_many :received_messages, class_name: 'Message', as: :recievable

  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def conversations
    @conversations = []
    self.proposals.each do |proposal|
      @conversations << proposal if proposal.messages.size > 0
    end
    @conversations
  end

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
