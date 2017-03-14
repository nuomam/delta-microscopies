class Deltadmin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout 'deltadmin'
end
