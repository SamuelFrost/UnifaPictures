sample_users = [
  {
    username: "SamPle",
    password: "BecausemynameisSam"
  },
]
sample_users.each do |user_info|
  User.find_or_create_by({username: user_info[:username]}) do |user|
    user.password = user_info[:password]
  end
end