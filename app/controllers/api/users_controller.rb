class Api::UsersController < ApplicationController
  respond_to :json

  def index
    @users = User.all

    @users = User.where(email: params[:email]) if params[:email]
    render json: @users
  end

  def show
    @user = User.find( params[:id] )
    render json: @user
  end

  def create
    @user = User.create( user_params )
    render json: @user
  end

  def update
    @user = User.update( params[:id], user_params )
    render json: @user
  end

  def destroy
    render json: User.destroy( params[:id] )
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit( :screen_name, :email )
  end
end
