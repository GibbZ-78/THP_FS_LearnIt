# Erase the content of all tables, hence reseting the related "id" counters
# NB: requires the "database_cleaner" gem to be part of the Rails environment
DatabaseCleaner.clean_with(:truncation)

# Création de users
# NB 1: requires the "faker" gem to be part of the Rails environment
# NB 2: at this stage, the "users" table solely contains "Devise mandatory fields": email and password. 
#       Remember to update the "users" table structure (via a dedicated migration) before launching this richer script!
puts
puts "SEEDING - Creation of several fake users : students, mentors and 1 admin"
puts

puts "  > Starts seeding 'Students' information"
5.times do |x|
	xstr = x+1 < 9 ? "0#{x+1}" : (x+1).to_s 
  User.create(first_name: Faker::Name.first_name, 
              last_name: Faker::Name.last_name, 
              password: "THP2022", 
              email: "student_#{xstr}@yopmail.com", 
              birthdate: Faker::Date.birthday(min_age: 16, max_age: 100),
              gender: Faker::Gender.binary_type,
              role:0,
              photo:"student_#{xstr}.jpg")
	puts "  > Student n°: #{User.last.id} - first_name: #{User.last.first_name} - last_name: #{User.last.last_name} - email: #{User.last.email} - password: #{User.last.encrypted_password} - birthdate: #{User.last.birthdate}"
end
puts "  > Finished seeding 'Students'"

# Seeding DB with 10 mentors
puts "  > Starts seeding 'Mentors' information"
5.times do |x|
	xstr = x+1 < 9 ? "0#{x+1}" : (x+1).to_s 
  User.create(first_name: Faker::Name.first_name, 
              last_name: Faker::Name.last_name, 
              password: "THP2022", 
              email: "mentor_#{xstr}@yopmail.com", 
              birthdate: Faker::Date.birthday(min_age: 18, max_age: 100),
              gender: Faker::Gender.binary_type,
              role:1,
              photo:"mentor_#{xstr}.jpg")
	puts "  > Mentor n°: #{User.last.id} - first_name: #{User.last.first_name} - last_name: #{User.last.last_name} - email: #{User.last.email} - password: #{User.last.encrypted_password} - birthdate: #{User.last.birthdate}"
end
puts "  > Finished seeding 'Mentors'"

# Seeding DB with 1 administrator
puts "  > Starts seeding unique admin information"
User.create(first_name: "admin", 
              last_name: "admin", 
              password: "THP2022", 
              email: "learnit_admin@yopmail.com", 
              birthdate: Faker::Date.birthday(min_age: 18, max_age: 100),
              gender: Faker::Gender.binary_type,
              role:2,
              photo:"photo_admin.jpg")
puts "  > Finished seeding admin"

# Création de items
puts
puts "SEEDING - Creation of some fake items"
puts
20.times do |x|
	Item.create(title: Faker::Games::Pokemon.name, description: Faker::Lorem.paragraph(sentence_count: 3), price: rand(8.0..99.0).round(2), image_url: "image_" + (x+1).to_s + ".jpg")
 	puts "  > Item n°: #{Item.last.id} - title: #{Item.last.title} - description: #{Item.last.description[0..20]} - price: #{Item.last.price} - image: #{Item.last.image_url}"
end
puts "  > Finished seeding items"
puts
puts "SEEDING - This is the end..."
