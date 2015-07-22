class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_column :comments, :password_digest, :string
  end
end
