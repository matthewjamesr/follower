class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret
      t.string :profile_image
      t.string :instance
      t.boolean :first_visit, default: true

      t.timestamps
    end
  end
end
