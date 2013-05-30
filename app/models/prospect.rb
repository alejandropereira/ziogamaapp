class Prospect < ActiveRecord::Base
  attr_accessible :address, :comments, :company, :email, :name, :phone, :product, :state, :status
  belongs_to :user
end
