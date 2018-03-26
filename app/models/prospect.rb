class Prospect < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  validates :organization, :presence => true
  
  def self.search(query)
    # Note that PostgreSQL is case specific for like when searching where sqlite3 is not
    where("LOWER(organization) like ?", "%#{query.downcase}%")
    # To search by more than one variable, do the following
    # where("LOWER(organization) like ? OR LOWER(status) like ?", "%#{query.downcase}%", "%#{query.downcase}%")
  end
  
end