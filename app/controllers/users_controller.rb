class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  before_action :convenor_user,  only: [:show, :index]
  before_action :admin_user,     only: [:destroy]

  helper_method :sort_column, :sort_direction

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @datasets = Dataset.where(:user_id => @user.id).paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # if @user.code == "e8b"
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Meta"
        redirect_to @user
      else
        render 'new'
      end
   #  else
   #    flash.now[:danger] = "You need the code from the HoD."
   #    render 'new'
   # end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = "User destroyed."
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :student_number, :email, :password, :password_confirmation, :admin, :convenor, :code)
    end

    def sort_column
      Photo.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Before filters
  end
