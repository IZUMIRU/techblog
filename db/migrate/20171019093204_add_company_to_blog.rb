class AddCompanyToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :company, :string
  end
end
