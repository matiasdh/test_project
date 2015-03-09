class CreateUserLikeTweets < ActiveRecord::Migration
  def change
    create_table :user_like_tweets do |t|
      t.references :user, index: true
      t.references :tweet, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_like_tweets, :users
    add_foreign_key :user_like_tweets, :tweets
  end
end
