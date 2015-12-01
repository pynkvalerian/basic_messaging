class Job < ActiveRecord::Base
  belongs_to :brand
  has_many :proposals
end
