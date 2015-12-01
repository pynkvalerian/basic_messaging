class Message < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :messageable, polymorphic: true
  belongs_to :recievable, polymorphic: true

  # before_create read: false

end
