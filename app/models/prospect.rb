class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true
  
  def self.search(query)
    where("organization like ?", "%#{query}%")
  end
  
end