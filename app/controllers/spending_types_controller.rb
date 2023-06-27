class SpendingTypesController < ApplicationController
  def index
    @spending_types = SpendingType.all.order(position: :asc)
  end

  def new
    @spending_type = SpendingType.new
  end

  def create
    @spending_type = SpendingType.new(spending_type_params)

    if @spending_type.save
      redirect_to spending_types_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spending_type = SpendingType.find(params[:id])
  end

  def update
    @spending_type = SpendingType.find(params[:id])

    if @spending_type.update(spending_type_params)
      redirect_to spending_types_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private
  def spending_type_params
    params.require(:spending_type).permit(:value, :position)
  end

end
