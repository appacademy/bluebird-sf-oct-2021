class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null:false 
    #name of method, table_name, column_name. data_type, constraints
    add_column :users, :age, :integer
  end
end
