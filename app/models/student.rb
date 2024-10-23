class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one_attached :profile_picture

    validates :first_name, :last_name, :major, :graduation_date, presence:true
'''    validates :school_email , uniqueness: {message:"Email Already exists"}
    validates :school_email, format: { with: /\A[\w+\-.]+@msudenver\.edu\z/i, message: "must be an @msudenver.edu email address" }'''
    
end
