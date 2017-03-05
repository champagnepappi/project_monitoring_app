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
  password: "morty",
  password_confirmation: "morty",
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
