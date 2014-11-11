class AddGroupsTable < ActiveRecord::Migration
  def change

    add_column :bills, :group_id, :integer

    create_table :groups do |t|
      t.integer :owner_id
      t.string :group_name
    end

    create_table :expensecategories do |t|
      t.string :description
      t.integer :group_id
    end

    create_table :groups_users, id:false do |t|
      t.belongs_to :group
      t.belongs_to :user
    end

    add_index :groups_users, [:group_id, :user_id]

  end
end
