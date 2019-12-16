class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_guid
      t.string :email
      t.string :hashed_password

      t.timestamps
    end
  end
end
