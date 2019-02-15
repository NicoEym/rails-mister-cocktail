class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
