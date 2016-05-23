class Category < ActiveRecord::Base
  has_many :works
  accepts_nested_attributes_for :works, allow_destroy: true

end
