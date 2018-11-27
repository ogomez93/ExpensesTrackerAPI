class Api::V1::ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET /api/v1/expenses
  # GET /api/v1/expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /api/v1/expenses/1
  # GET /api/v1/expenses/1.json
  def show
  end

  # POST /api/v1/expenses
  # POST /api/v1/expenses.json
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      render :show, status: :created, location: api_v1_expense_path(@expense)
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/expenses/1
  # PATCH/PUT /api/v1/expenses/1.json
  def update
    if @expense.update(expense_params)
      render :show, status: :ok, location: api_v1_expense_path(@expense)
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/expenses/1
  # DELETE /api/v1/expenses/1.json
  def destroy
    @expense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :currency, :description, :title, :category_id, :user_id)
    end
end
