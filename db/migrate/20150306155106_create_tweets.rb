class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :tweets, :users
  end
end
