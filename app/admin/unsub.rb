ActiveAdmin.register Unsub do

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

index do
  selectable_column
  column :id
  column :service_id
  column 'Customer email'
  column 'Complete'
  column 'Payed'
  column 'Sent'
  column 'Confirmed'

end


end
