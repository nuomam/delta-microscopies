class Deltadmin::PagesController < Deltadmin::ApplicationController
  skip_before_action :authenticate_user!, only: [ :admin ]

  def dashboard
  end
end
