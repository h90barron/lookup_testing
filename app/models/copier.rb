class Copier < ActiveRecord::Base
  validates :name, uniqueness: true
end
