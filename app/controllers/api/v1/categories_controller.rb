class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /api/v1/categories
  # GET /api/v1/categories.json
  def index
    @categories = Category.all
  end

  # GET /api/v1/categories/1
  # GET /api/v1/categories/1.json
  def show
  end

  # POST /api/v1/categories
  # POST /api/v1/categories.json
  def create
    @category = Category.new(category_params)

    if @category.save
      render :show, status: :created, location: api_v1_category_path(@category)
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/categories/1
  # PATCH/PUT /api/v1/categories/1.json
  def update
    if @category.update(category_params)
      render :show, status: :ok, location: api_v1_category_path(@category)
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/categories/1
  # DELETE /api/v1/categories/1.json
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end
