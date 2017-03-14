class Deltadmin::UsersController < Deltadmin::ApplicationController
  before_action :set_user , only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all.order(email: 'ASC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to deltadmin_user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to deltadmin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to deltadmin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :admin)
  end

end
