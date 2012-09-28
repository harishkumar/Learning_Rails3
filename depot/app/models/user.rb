class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :role_id, :salt
 # belongs_to :role
   validates :email, :uniqueness => true
  has_many :products
end
