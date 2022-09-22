class UnitReport < ApplicationRecord
  validates :year, presence: true

  belongs_to :category

  before_save :sync_record

  def sync_record
    total = [april, may, june, july, august, september, october, november, december, january, february, march].compact.sum

    self.year_total = total
    self.year_average = (total/12).round(2)
  end
end
