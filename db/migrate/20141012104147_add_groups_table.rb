class AddGroupsTable < ActiveRecord::Migration
  def change

    add_column :bills, :group_id, :string

    create_table :groups do |t|
      t.integer :owner_id
      t.string :group_name
      # t.has_many :bills
      # t.has_many :expense_categories
    end

    create_table :expense_categories do |t|
      t.string :description
      t.belongs_to :group
    end

    create_table :groups_users, id:false do |t|
      t.belongs_to :group
      t.belongs_to :user
    end

    add_index :groups_users, [:group_id, :user_id]

  end
end
