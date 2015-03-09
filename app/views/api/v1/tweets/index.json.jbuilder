json.tweets do
  json.array!(@tweets) do |tweets|
    json.id tweets.id
    json.text tweets.text
    json.user tweets.user
  end
end
