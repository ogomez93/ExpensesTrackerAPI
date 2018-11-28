class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  # GET /api/v1/users.json
  def index
    @users = User.all
  end

  # GET /api/v1/users/1
  # GET /api/v1/users/1.json
  def show
  end

  # POST /api/v1/users
  # POST /api/v1/users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: api_v1_user_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  # PATCH/PUT /api/v1/users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: api_v1_user_path(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  # DELETE /api/v1/users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :username, :phone_number)
    end
end
