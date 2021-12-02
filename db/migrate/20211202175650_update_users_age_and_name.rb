class UpdateUsersAgeAndName < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name
    remove_column :users, :age
    add_column :users, :name, :string
    add_column :users, :age, :integer, null: false
  end
end
