class Restaurant < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :street, :zipcode, :town
end
