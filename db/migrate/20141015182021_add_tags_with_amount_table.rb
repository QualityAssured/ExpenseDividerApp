class AddTagsWithAmountTable < ActiveRecord::Migration
  def change
    create_table :tags_with_amounts do |t|
      t.belongs_to :bill
      t.integer :bill_id
      t.string :tag_name
      t.integer :user_to_pay_id
      t.float :amount
    end
  end
end
