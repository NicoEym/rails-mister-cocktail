class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    # we need @restaurant in our `simple_form_for
    @dose = Dose.new
  end


  def create
    @ingredients = Ingredient.find(params[:dose][:ingredient_id])
    @ingredients.each do |ingredient|
      dose = Dose.new
      dose.cocktail = @cocktail
      dose.ingredient = ingredient
      dose.description = params[:dose][:description]
      dose.save
    end
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
