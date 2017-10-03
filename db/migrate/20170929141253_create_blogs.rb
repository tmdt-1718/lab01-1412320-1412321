class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.integer :view_count

      t.timestamps
    end
  end
end
