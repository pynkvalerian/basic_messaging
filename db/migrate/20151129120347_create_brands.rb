class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :username
      t.string :password_digest
      t.string :remember_token

      t.timestamps null: false
    end
  end
end
