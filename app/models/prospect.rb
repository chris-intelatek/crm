class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true
  
  def self.search(query)
    where("LOWER(organization) like ?", "%#{query.downcase}%")
  end
  
end