class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :user_id, :uploaded_file
 
#set up "uploaded_file" field as attached_file (using Paperclip) 
# has_attached_file :uploaded_file
  
# validates_attachment_size :uploaded_file, :less_than => 10.megabytes   
# validates_attachment_presence :uploaded_file
  has_many :coffers
  attr_accessor :email, :name, :password, :password_confirmation, :remember_me
  validates :email, :presence => true, :uniqueness => true
end
