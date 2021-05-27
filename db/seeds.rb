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