class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      #data_type :name_column, database_contraints
      t.string :username, null: false 
      t.string :email, null: false 
      t.timestamps 
    end
    add_index :users, :username, unique: true 
    add_index :users, :email, unique: true 
    # method  table_name, column_name, constraint
  end
end
