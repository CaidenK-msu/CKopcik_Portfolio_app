class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one_attached :profile_picture

    '''validates :first_name, :last_name, :email, :major, :graduation_date, presence:true
    validates :email , uniqueness: {message:"Email Already exists"}
    validates :email, format: { with: /\A[\w+\-.]+@msudenver\.edu\z/i, message: "must be an @msudenver.edu email address" }'''
    
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    validate :email_format
    def email_format
        unless email =~ /\A[\w+\-.]+@msudenver\.edu\z/i
            errors.add(:email, "must be an @msudenver.edu email address")
        end
    end
 
end
