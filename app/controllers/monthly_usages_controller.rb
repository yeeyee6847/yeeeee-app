class MonthlyUsagesController < ApplicationController

  def show
    @monthly_usage = MonthlyUsage.find(params[:id])
    @yearly_usage = @monthly_usage.yearly_usage
    @daily_usages = @monthly_usage.daily_usages.order(params_sort_column("date") => params_sort_direction("asc"))

    generate_today_daily_usage_path
    generate_warning_message
    if params[:viewmode].present?
      set_view_mode_cookie(params[:viewmode])
    end
    
  end

  def generate_today_daily_usage_path
    if Date.today.year == @yearly_usage.year && Date.today.month == @monthly_usage.month.position
      daily_usage = DailyUsage.get_today_daily_usage
      if daily_usage.daily_status.nil?
        @today_daily_usage_path = edit_yearly_usage_monthly_usage_daily_usage_path(@yearly_usage, @monthly_usage, daily_usage)
      else
        @today_daily_usage_path = yearly_usage_monthly_usage_daily_usage_path(@yearly_usage, @monthly_usage, daily_usage)
      end        
    end
  end

  def generate_warning_message
    daily_usages = DailyUsage.get_daily_usage_daily_status_is_null_by_date_range(@monthly_usage, Date.new(@yearly_usage.year, @monthly_usage.month.position).beginning_of_month, Date.today)
    if daily_usages.size > 0
      @warning_message = "Please ensure the daily status is updated."
    end
  end

  def set_view_mode_cookie(value)
    cookies[:viewmode] = {
      value: value,
      secure: true,
      httponly: true
    }
  end

end
