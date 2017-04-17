class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :username
      t.timestamp :last_tweet_time, default: nil
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
