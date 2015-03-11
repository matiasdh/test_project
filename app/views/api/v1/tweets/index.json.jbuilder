json.tweets do
  json.array!(@tweets) do |tweet|
    json.id tweet.id
    json.text tweet.text
    json.user tweet.user
    json.like_by_me tweet.liked_by?(current_user)
  end
end
