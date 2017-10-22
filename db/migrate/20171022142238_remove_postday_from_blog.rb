class RemovePostdayFromBlog < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :postday, :date
    add_column :blogs, :postday, :string
  end
end
