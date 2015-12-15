class Company < ActiveRecord::Base
  has_many :jobs

  validates :mail, :location, :name, :phone, presence: true
end
