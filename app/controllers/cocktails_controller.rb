class CocktailsController < ApplicationController
  def new
    @cocktail = Cocktail.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
