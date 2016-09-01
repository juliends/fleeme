ActiveAdmin.register Service do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  scope :all, :default => true

  permit_params :name, :company, :street_address, :zip_code, :city, :postal_box, :form_specs, photos: []

  controller do
    def create
      @service = Service.new(permitted_params[:service])
      @service.save
      if @service.save
        render :action => :show
      else
        render "new"
      end
    end
  end

  form title: 'Create service' do |f|
    inputs 'Service Details' do
      input :name
      input :company
    end
    inputs 'Service address' do
      input :street_address
      input :zip_code
      input :city
      input :postal_box
    end

    inputs "Form" do
      input :form_specs
    end

    inputs "Pictures" do
      input :photos, :as => :formtastic_attachinary
    end
    para "Press cancel to return to the list without saving."
    actions
  end

  show do
    attributes_table do
      row :name
      row :company
      row :street_address
      row :zip_code
      row :city
      row :postal_box
      panel 'Picture' do
        table_for 'Pictures' do
          service.photos.each do |photo|
            span do
              cl_image_tag(photo.path, { size: '125x125', crop: :fit })
            end
          end
        end
      end
    end
  end
end
