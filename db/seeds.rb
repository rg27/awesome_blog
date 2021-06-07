User.create(
	name: "Rey Mar Gualvez",
	email: "rgualvez@gmail.com",
	password: "password"
)

50.times do |n|
	User.create(
		name: Faker::Name.first_name,
		email: Faker::Internet.unique.email,
		password: "password"
	)
end

#create following relationship
users = User.all
user = users.first
#following
followed_users = users[2..50]
follower_users = users[3..50]
followed_users.each {|followed| user.follow(followed)}
follower_users.each { |follower| follower.follow(user)}