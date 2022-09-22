rails g model Category
rails db:migrate
update the migration file
rails db:migrate
rails g model UnitReport
change the file based on requirement
rails db:migrate
define association in models

add validation in Category and UnitReport
add callback methods in UnitReport to sync_up the database

open rails c and create some demo data
Category.create(name: "Provident Fund")
c = Category.first
ur = c.unit_reports.new
ur.april = 30
ur.july = 40
ur.year = 2022
ur.year_target = 30
ur.save

* Category.create(name: "House Benifit")
c = Category.second
ur = c.unit_reports.new
ur.april = 50
ur.july = 30
ur.year = 2022
ur.year_target = 30
ur.save

c = Category.first
ur = c.unit_reports.new
ur.april = 50
ur.july = 30
ur.year = 2021
ur.year_target = 30
ur.save

c = Category.second
ur = c.unit_reports.new
ur.april = 50
ur.july = 30
ur.year = 2021
ur.year_target = 30
ur.save

now we have to create controller
$ rails g controller UnitReports

now you need to add route in route.rb
get "unit_report/:year", to: "reports#unit_report"

in controller add unit_report action and write the logic to render the database

Currently I done only get unit_reports by year
