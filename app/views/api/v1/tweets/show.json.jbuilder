json.tweet do
  json.id @tweet.id
  json.text @tweet.text
  json.user do
    json.partial! partial: 'api/v1/users/user', locals: { user: @tweet.user }
  end
end
