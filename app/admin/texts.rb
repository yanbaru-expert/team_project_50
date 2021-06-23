ActiveAdmin.register Text do
  permit_params :genre, :title, :content

  index do
    selectable_column
    id_column
    column :genre, :text, &:genre_i18n
    column :title
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      # enum-help を利用
      input :genre, as: :select, collection: Text.genres_i18n.invert
      input :title
      input :content
    end
    f.actions
  end

  filter :genre, as: :select, collection: Text.genres_i18n.invert.transform_values { |v| Text.genres[v] }
  filter :title
  filter :content
  filter :created_at
  filter :updated_at
end
