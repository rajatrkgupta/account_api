class PhoneNumber < ActiveRecord::Base
  belongs_to :account

  validates :number, presence: true, uniqueness: true
end
