ActiveAdmin.register Display do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :id, :margue,:left_photo,:signage_video,:right_photo,:bottom_photo

 index do
    selectable_column
    actions
    column :id
    column :margue
    column :created_at
  end

  form do |f|
    f.inputs "Display" do
      f.input :margue
      f.input :left_photo
      f.input :right_photo
      f.input :bottom_photo
      f.input :signage_video
    end
    f.actions
  end

end
