class AddTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :user_id
    end
  end
end
