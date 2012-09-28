class Product < ActiveRecord::Base
  attr_accessible :description, :name, :photo_name, :photo_path, :photo_type, :price, :user_id
end
