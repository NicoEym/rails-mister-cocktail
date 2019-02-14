class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    # we need @restaurant in our `simple_form_for`

    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # we need `cocktail_id` to asssociate dose with corresponding cocktail
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
