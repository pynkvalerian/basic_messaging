class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :proposal_id
      t.boolean :read
      t.references :messageable, polymorphic: true
      t.references :recievable, polymorphic: true

      t.timestamps null: false
    end
  end
end
