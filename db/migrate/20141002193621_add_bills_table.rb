class AddBillsTable < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.belongs_to :user
      t.integer :user_id
      t.float :total
      t.string :tags
    end
  end
end
