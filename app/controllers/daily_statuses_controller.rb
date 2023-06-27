class DailyStatusesController < ApplicationController
  def index
    @daily_statuses = DailyStatus.all.order(position: :asc)
  end

  def new
    @daily_status = DailyStatus.new
  end

  def create
    @daily_status = DailyStatus.new(daily_status_params)

    if @daily_status.save
      redirect_to daily_statuses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @daily_status = DailyStatus.find(params[:id])
  end

  def update
    @daily_status = DailyStatus.find(params[:id])

    if @daily_status.update(daily_status_params)
      redirect_to daily_statuses_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private
  def daily_status_params
    params.require(:daily_status).permit(:value, :position)
  end
end
