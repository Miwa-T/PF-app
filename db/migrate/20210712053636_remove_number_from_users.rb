class RemoveNumberFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :number, :string
  end
end
