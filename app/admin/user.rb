ActiveAdmin.register User do
  permit_params :email, :admin
end
