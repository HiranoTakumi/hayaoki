class ModifyUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :name, unique: true, name: 'name_index'
    add_index :users, :time, name: 'time_index'
  end
end
