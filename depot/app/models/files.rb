class Files < ActiveRecord::Base
  attr_accessible :name, :path, :type, :user_id
end
