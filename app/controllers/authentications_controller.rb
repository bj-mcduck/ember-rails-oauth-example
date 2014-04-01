class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :destroy]
  before_action :set_user, only: [:create, :destroy]

  def show
  end

  def new
    @authentication = Authentication.new
  end

  def edit
  end

  def create
    @authentication = Authentication.new(authentication_params)

    respond_to do |format|
      if @authentication.save
        format.html { redirect_to @user, notice: 'Authentication was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @authentication.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      params.require(:authentication).permit(:user_id, :provider, :uid, :name, :email)
    end
end
