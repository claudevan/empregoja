class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category

  validates :title, :category_id, :description, :location, presence: true
end
