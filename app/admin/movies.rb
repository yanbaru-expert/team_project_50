ActiveAdmin.register Movie do

  index do
    selectable_column
    id_column
    column :genre, :movie, &:genre_i18n
    column :title
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      # enum-help を利用
      input :genre, as: :select, collection: Movie.genres_i18n.invert
      input :title
      input :url
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :genre, :title, :url
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre, :title, :url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :genre, as: :select, collection: Movie.genres_i18n.invert.transform_values { |v| Movie.genres[v] }
  filter :title
  filter :url
  filter :created_at
  filter :updated_at
end