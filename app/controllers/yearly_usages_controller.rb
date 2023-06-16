class YearlyUsagesController < ApplicationController

  before_action :get_year_dropdown

  def index
    @yearly_usages = YearlyUsage.all
  end

  def show 
    @yearly_usage = YearlyUsage.find(params[:id])
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

  def edit
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
