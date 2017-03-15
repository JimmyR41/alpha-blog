class UsersController <ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Updated succesfully"
      redirect_to articles_path
    else
      route_to "edit"
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
