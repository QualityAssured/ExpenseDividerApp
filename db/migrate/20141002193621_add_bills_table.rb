class AddBillsTable < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :user_id
      t.float :total
      t.string :tags
    end
  end
end
