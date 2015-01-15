class Contact < ActiveRecord::Base

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  NAME_REGEX = /\A[a-zA-Z .]+\z/
  validates :name, presence: true, format: {with: NAME_REGEX, message: "is not valid"}, uniqueness: true
  validates :mobile_no, presence: true, length: {is: 10}, numericality: {only_integer: true, greater_than: 0}, uniqueness: true
  validates :email, presence:  true, format: {with: EMAIL_REGEX, message: "is not valid"}, uniqueness: true
 
  
  

end
