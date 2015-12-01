class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :title

      t.timestamps null: false
    end
  end
end
