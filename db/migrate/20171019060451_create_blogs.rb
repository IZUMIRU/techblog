class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
