class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    self.inheritance_column = :user_type 
	def self.user_type
	  %w(Novice Expert)
	end
	has_many :campaigns, dependent: :destroy
    has_many :todos, dependent: :destroy
    has_many :comments,dependent: :destroy
	scope :experts, -> { where(user_type: 'Expert') } 
	scope :novices, -> { where(user_type: 'Novice') } 
	
end
