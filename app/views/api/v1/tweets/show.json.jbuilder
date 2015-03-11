json.tweet do
  json.id @tweet.id
  json.text @tweet.text
  json.user do
    json.partial! partial: 'api/v1/users/user', locals: { user: @tweet.user }
  end
  json.like_by_me @tweet.liked_by?(current_user)
end
