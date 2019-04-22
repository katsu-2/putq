class CreateFolderPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :folder_posts do |t|
      t.references :folder, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
