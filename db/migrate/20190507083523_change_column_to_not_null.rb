class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :categories, :name, :string, null: true
  end

  def down
    change_column :categories, :name, :string
  end
end
