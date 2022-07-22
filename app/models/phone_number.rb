class PhoneNumber < ActiveRecord::Base
  self.table_name = "phone_number"

  belongs_to :account

  validates :number, presence: true, uniqueness: true
end
