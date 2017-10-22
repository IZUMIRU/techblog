class AddPostdayToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :postday, :date
  end
end
