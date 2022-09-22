class Category < ApplicationRecord
  validates :name, presence: true

  has_many :unit_reports
end
