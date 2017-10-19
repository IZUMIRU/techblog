ActiveAdmin.register Blog do
  permit_params :image, :title, :url

  index do
    selectable_column
    id_column
    column :image
    column :title
    column :url
    column :created_at
    column :updated_at
    actions
  end

  filter :image
  filter :title
  filter :url
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :image
      f.input :title
      f.input :url
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end
end
