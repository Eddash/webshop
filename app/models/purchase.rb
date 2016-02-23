class Purchase < ActiveRecord::Base
  belongs_to :whisky
  belongs_to :buyer, class_name: 'User'
end
