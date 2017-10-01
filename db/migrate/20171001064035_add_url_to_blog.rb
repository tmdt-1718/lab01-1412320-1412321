class AddUrlToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :url, :string
  end
end
