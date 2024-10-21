class Student < ApplicationRecord
    has_one_attached :profile_picture

    '''validates :first_name, :last_name, :email, :major, :graduation_date, presence:true
    validates :email , uniqueness: {message:"Email Already exists"}
    validates :email, format: { with: /\A[\w+\-.]+@msudenver\.edu\z/i, message: "must be an @msudenver.edu email address" }'''
    
end
