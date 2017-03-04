ActiveAdmin.register SubCategory do
  permit_params :name, :description, :category_id
end
