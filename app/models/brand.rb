class Brand < ActiveRecord::Base
  has_secure_password

  has_many :jobs
  has_many :sent_messages, class_name: 'Message', as: :messageable
  has_many :received_messages, class_name: 'Message', as: :recievable

  before_create :create_remember_token

  def Brand.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Brand.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def conversations
    # self.jobs.collect { |job| job.proposals }.to_ary
    @conversations = []
    self.jobs.each do |job|
      job.proposals.each do |p|
        @conversations << p if p.messages.size > 0
      end
    end
    @conversations
  end

  private
    def create_remember_token
      self.remember_token = Brand.digest(Brand.new_remember_token)
    end
end
