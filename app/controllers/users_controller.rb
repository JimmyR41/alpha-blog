class UsersController <ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the blog #{@user.username}"
      redirect_to articles_path
    else
      route_to 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Updated succesfully"
      redirect_to articles_path
    else
      route_to "edit"
    end
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
