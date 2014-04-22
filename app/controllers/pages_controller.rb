class PagesController < ApplicationController
  def home
    
  	@pakistan = Strike.strikes_per_year("Pakistan")
  	@yemen = Strike.strikes_per_year("Yemen")
  	@somalia = Strike.strikes_per_year("Somalia")
  	@countries = Strike.all_strikes_countries
  	@yearly_militant_deaths = Strike.deaths_per_year("deaths")
  	@yearly_civilian_deaths = Strike.deaths_per_year("civilians")

  	@militant_deaths = Strike.sum(:deaths_min)
  	@civilian_deaths = Strike.sum(:civilians)
  	@child_deaths = Strike.sum(:children)
  	@casualties = Strike.sum(:injuries)
  end

  def about
  end
end
