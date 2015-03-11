json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.email user.email
json.tweets do
  json.array!(user.tweets) do |tweet|
    json.id tweet.id
    json.text tweet.text
  end
end
