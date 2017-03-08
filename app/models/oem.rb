class Oem < ActiveRecord::Base
  validates :name, uniqueness: true
end
