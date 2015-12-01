class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  has_many :messages
end
