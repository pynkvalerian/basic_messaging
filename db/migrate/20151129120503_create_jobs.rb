class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :brand_id
      t.string :title

      t.timestamps null: false
    end
  end
end
