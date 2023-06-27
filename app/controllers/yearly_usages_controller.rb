class YearlyUsagesController < ApplicationController

  before_action :get_year_dropdown

  def index
    @yearly_usages = YearlyUsage.order(params_sort_column("year") => params_sort_direction("desc"))
  end

  def show 
    @yearly_usage = YearlyUsage.find(params[:id])
    @monthly_usages = @yearly_usage.monthly_usages.order(params_sort_column("month_id") => params_sort_direction("asc"))
    if @yearly_usage.year == Date.today.year
      monthly_usage = MonthlyUsage.get_current_monthly_usage(@yearly_usage)
      @current_monthly_usage_path = yearly_usage_monthly_usage_path(@yearly_usage, monthly_usage)
    end
  end

  def new
    @yearly_usage = YearlyUsage.new
  end

  def create
    @yearly_usage = YearlyUsage.new(yearly_usage_params)

    if @yearly_usage.save
      redirect_to @yearly_usage
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @yearly_usage = YearlyUsage.find(params[:id])
    @yearly_usage.destroy

    redirect_to yearly_usages_path, notice: "Record was successfully deleted"
  end

  private
  def yearly_usage_params
    params.require(:yearly_usage).permit(:year)
  end

  def get_year_dropdown
    current_year = Time.now.year
    year_range = (current_year - 10..current_year).to_a.reverse
    @year_dropdown = year_range.map { | year | [year.to_i, year]}
  end
  
end
