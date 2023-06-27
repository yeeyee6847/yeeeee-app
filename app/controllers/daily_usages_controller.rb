class DailyUsagesController < ApplicationController
  def show
    @daily_usage = DailyUsage.find(params[:id])
    @monthly_usage = @daily_usage.monthly_usage
    @yearly_usage = @monthly_usage.yearly_usage
    @expense_items = @daily_usage.expense_items.joins(:spending_type).order(params_sort_column("spending_types.id") => params_sort_direction("asc"))
  end

  def edit
    @daily_usage = DailyUsage.find(params[:id])
    @monthly_usage = @daily_usage.monthly_usage
    @yearly_usage = @monthly_usage.yearly_usage
  end

  def update
    @daily_usage = DailyUsage.find(params[:id])
    @monthly_usage = @daily_usage.monthly_usage
    @yearly_usage = @monthly_usage.yearly_usage

    if @daily_usage.update(daily_usage_params)
      redirect_to yearly_usage_monthly_usage_daily_usage_path(@daily_usage.monthly_usage.yearly_usage, @daily_usage.monthly_usage, @daily_usage)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def daily_usage_params
    params.require(:daily_usage).permit(:daily_status_id)
  end

end
