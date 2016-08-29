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

  permit_params :name, :company, :street_address, :zip_code, :city, :postal_box, :form_specs

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

end
