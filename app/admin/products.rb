ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :title, :name, :description, :picture, :actual_price, :offered_price, :quantity, :product_type, :manufacture_date, :sub_category_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form title: 'A custom title' do |f|
  	f.input :sub_category
    f.input :title
    f.input :name
    f.input :description
    f.input :actual_price
    f.input :offered_price
    f.input :quantity
    f.input :product_type
    f.input :manufacture_date, as: :datepicker
    f.inputs "Attachment", :multipart => true do 
		  f.input :picture, :as => :file, :hint => f.object.picture.present? \
		    ? image_tag(f.object.picture.url(:thumb))
		    : content_tag(:span, "no picture yet")		  
		end
    para "Press cancel to return to the list without saving."
    actions
  end
  
  index do
	  selectable_column
	  column :title
	  column :name
	  column :description
	  column :sub_category
	  column "Image" do |product|
  		image_tag product.picture.url(:thumb), class: 'my_image_size'
		end
		column :quantity
		column :product_type
		column :actual_price
		column :offered_price
		column :manufacture_date
		actions
	end

end
