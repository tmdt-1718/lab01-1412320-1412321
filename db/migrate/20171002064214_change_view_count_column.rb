class ChangeViewCountColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :blogs, :view_count, :views
    change_column :blogs, :views, :integer, default: 0
  end
end
