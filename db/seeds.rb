# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.destroy_all
Division.destroy_all
Project.destroy_all
EmployeeProject.destroy_all


10.times do |index|
  division = Division.create!({name: Faker::Fantasy::Tolkien.character})
  5.times do |index|
    Employee.create!({name: Faker::Name.name, division_id: division.id})
  end
end

10.times do |index|
  Project.create!({name: Faker::JapaneseMedia::StudioGhibli.character})
end

p "Created #{Division.count} divisions"
p "Created #{Employee.count} employees"
p "Created #{Project.count} projects"