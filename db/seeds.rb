#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(
  first_name: "Kevyne",
  last_name: "Santos",
  email: "santos@gmail.com",
  reg_no: "COM/0040/13",
  gender: "Male",
  department: "IT",
  course_taken: "IT",
  password: "rickmorty",
  password_confirmation: "rickmorty",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

lec = Lecturer.create!(
  first_name: "David",
  last_name: "Santon",
  email: "david@gmail.com",
  password: "hacked",
  password_confirmation: "hacked",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)
user = User.create!(
  first_name: "Jane",
  last_name: "Sharon",
  email: "sharon@gmail.com",
  reg_no: "SIT/0020/13",
  gender: "Female",
  department: "IT",
  course_taken: "IT",
  password: "tyrant",
  password_confirmation: "tyrant",
  admin: false,
  activated: true,
  activated_at: Time.zone.now
)

20.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  reg_no = Faker::Number.number(10)
  email = Faker::Internet.email
  gender = User::GENDER.sample
  department = User::DEPARTMENT.sample
  course_taken = User::COURSE_TAKEN.sample
  password = "password"
  User.create!(first_name: first_name,
              last_name: last_name,
              reg_no: reg_no,
              email: email,
              gender: gender,
              department: department,
              course_taken: course_taken,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)

end

# users = User.order(:created_at).take(6)
# 1.times do
#   title = Faker::Commerce.product_name
#   description = Faker::Lorem.paragraph(4)
#   users.each {|user|
#   user.projects.create!(title: title, description: description)
#   }
  
# end

