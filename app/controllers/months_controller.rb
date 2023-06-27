class MonthsController < ApplicationController
  before_action :get_position_dropdown

  def index
    @months = Month.all.order(position: :asc)
  end

  def show
    @month = Month.find(params[:id])
  end

  def new
    @month = Month.new
  end

  def create
    @month = Month.new(month_params)

    if @month.save
      redirect_to months_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @month = Month.find(params[:id])  
  end

  def update
    @month = Month.find(params[:id])  

    if @month.update(month_params)
      redirect_to months_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @month = Month.find(params[:id])
    @month.destroy

    redirect_to months_path, notice: "Record was successfully deleted"
  end

  private 
  def month_params
    params.require(:month).permit(:value, :position)
  end

  def get_position_dropdown
    position_range = 1..12
    @position_dropdown = position_range.map { | position | [position.to_i, position]}
  end
end
