class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :organization, :presence => true
end