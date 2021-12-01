class UpdateUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :political_affiliation, :string

    add_index :users, :political_affiliation
  end
end
