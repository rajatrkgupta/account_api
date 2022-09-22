class CreateUnitReports < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_reports do |t|
      t.decimal :april
      t.decimal :may
      t.decimal :june
      t.decimal :july
      t.decimal :august
      t.decimal :september
      t.decimal :october
      t.decimal :november
      t.decimal :december
      t.decimal :january
      t.decimal :february
      t.decimal :march
      t.string :year
      t.decimal :year_total
      t.decimal :year_average
      t.decimal :year_target
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
