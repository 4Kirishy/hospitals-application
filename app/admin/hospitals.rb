ActiveAdmin.register Hospital do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :location, :year, :category, :city, :rating_mortality, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :location, :year, :category, :city, :rating_mortality]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input :name
      f.input :location
      f.input :year
      f.input :category
      f.input :city
      f.input :rating_mortality
      f.input :image, as: :file
    end
    f.actions
  end
end
