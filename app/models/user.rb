class User < ActiveRecord::Base
	simple_roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :name, :username, :avatar
  # attr_accessible :title, :body

  mount_uploader :avatar, ImageUploader

  has_many :prospects
  has_many :appointments
end
