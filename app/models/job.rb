class Job < ActiveRecord::Base
  belongs_to :company
  validates :title, :category, :description, :location, :company_id, presence: true
end
