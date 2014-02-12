class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :waitlist, default: "false"
      t.string :provider
      t.integer :uid
      t.string :name
      t.string :nickname
      t.string :location
      t.string :image
      t.string :description
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
