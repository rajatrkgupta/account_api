class Account < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :auth_id, presence: true

  has_many :phone_numbers
end
