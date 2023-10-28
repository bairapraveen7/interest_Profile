class CreateTimelines < ActiveRecord::Migration[7.0]
  def change
    create_table :timelines do |t|
      t.text :attributeValue
      t.integer :attributeType
      t.references :user, null: false, foreign_key: true
      t.references :timelineType, polymorphic: true, null: false

      t.timestamps
    end
  end
end
