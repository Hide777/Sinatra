class CreatePosts < ActiveRecord::Migration
  def change

    create_table :posts do |t|
      t.string :username
      t.string :content
      t.timestamps
    end

  end
end
