# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Lawyer.create(name: "Harvey Specter", specialty: "Litigations", title: "Named Partner", age: 35)
Lawyer.create(name: "Jessica Pearson", specialty: "Family", title: "Managing Partner", age: 43)
Case.create(lawyer_id: 1, name: 'KC Motors', body: 'They fooled me once. I will make it right.')