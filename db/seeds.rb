Faker::Config.locale = :ja

User.create!(
  name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  admin:     true,
  activated: true,
  activated_at: Time.zone.now
)

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(
    name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

#本のダミー
#users = User.order(:created_at).take(6)   #最初の6人
users = User.all

# rand(10).times do
#   content = Faker::Book.title
#   users.each { |user| user.books.create!(content: content) }
# end
post = [5,7,9,11,13]
users.each do |user|
  post[rand(5)].times do
    title = Faker::Book.title
    content = Faker::Lorem.sentence(word_count:3)
    user.books.create!(title: title, content: content)
  end
end

User.create!(
  name:  "test-user",
  email: "test@gmail.com",
  password:              "password",
  password_confirmation: "password",
  activated: true,
  activated_at: Time.zone.now
)