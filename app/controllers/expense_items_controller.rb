class ExpenseItemsController < ApplicationController
  def show
    @expense_item = ExpenseItem.find(params[:id])
    create_parent_object_variable(@expense_item)
  end

  def new
    @daily_usage = DailyUsage.find(params[:daily_usage_id])
    create_parent_object_variable(@daily_usage)
    @expense_item = @daily_usage.expense_items.build
  end

  def create
    @daily_usage = DailyUsage.find(params[:daily_usage_id])
    create_parent_object_variable(@daily_usage)
    @expense_item = @daily_usage.expense_items.create(expense_item_params)

    if @expense_item.save
      redirect_to yearly_usage_monthly_usage_daily_usage_path(@yearly_usage, @monthly_usage, @daily_usage)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @expense_item = ExpenseItem.find(params[:id])
    create_parent_object_variable(@expense_item)

  end

  def update
    @expense_item = ExpenseItem.find(params[:id])
    create_parent_object_variable(@expense_item)

    if @expense_item.update(expense_item_params)
      redirect_to yearly_usage_monthly_usage_daily_usage_path(@yearly_usage, @monthly_usage, @daily_usage)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @daily_usage = DailyUsage.find(params[:daily_usage_id])
    create_parent_object_variable(@daily_usage)
    @expense_item = ExpenseItem.find(params[:id])
    @expense_item.destroy

    redirect_to yearly_usage_monthly_usage_daily_usage_path(@yearly_usage, @monthly_usage, @daily_usage), notice: "Record was successfully deleted."
  end

  private
  def expense_item_params
    params.require(:expense_item).permit(:spending_type_id, :expense_item, :remark, :amount)
  end

  def create_parent_object_variable(object)
    if object.is_a?(ExpenseItem)
      @daily_usage = object.daily_usage
    end
    @monthly_usage = @daily_usage.monthly_usage
    @yearly_usage = @monthly_usage.yearly_usage   
  end
end
