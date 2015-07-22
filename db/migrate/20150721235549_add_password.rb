class AddPassword < ActiveRecord::Migration
  def change
    add_column :comments, :password, :string
  end
end
