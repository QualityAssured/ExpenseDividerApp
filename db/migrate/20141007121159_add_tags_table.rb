class AddTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :user
      t.integer :user_id
      t.string :description
    end
  end
end
