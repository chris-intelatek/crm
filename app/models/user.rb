class User < ActiveRecord::Base
  has_many :prospects, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



         
  def self.search(query)
    # Note that PostgreSQL is case specific for like when searching where sqlite3 is not
    where("LOWER(advisor_first_name) like ? OR LOWER(advisor_last_name) like ? OR LOWER(email) like ? OR LOWER(advisor_phone) like ? OR LOWER(advisor_mobile) like ?", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  end




  def password_required?
    false
  end
  
  def advisor_name
    [advisor_first_name, advisor_last_name].join(' ')
  end

end