class StrikesController < ApplicationController

  require 'will_paginate/array'
  helper_method :sort_column, :sort_direction

  def index
    @strikes = Strike.search(params[:search]).order_by(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @strikes }
      format.js
    end

    @pakistan = Strike.strikes_per_year("Pakistan")
    @yemen = Strike.strikes_per_year("Yemen")
    @somalia = Strike.strikes_per_year("Somalia")
    @countries = Strike.all_strikes_countries
    @yearly_militant_deaths = Strike.deaths_per_year("deaths")
    @yearly_civilian_deaths = Strike.deaths_per_year("civilians")
  end

  def show
    @strike = Strike.find(params[:id])

    respond_to do |format|
        format.html #show.html.erb
        format.js #show js.erb
        format.json { render json: @strike }
    end
  end

  def locations
    puts "hello hello"
    @all_strikes = Strike.all.to_a
    @geojson = []

    @all_strikes.each do |strike|
      @geojson.push(
        {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [strike.lon, strike.lat]
          },
          properties: {
            town: strike.town,
            country: strike.country,
            date: strike.date.strftime('%B %d, %Y'),
            deaths: strike.deaths_max,
            injuries: strike.injuries,
            summary: strike.bij_summary_short,

            :'marker-color' => '#00607d',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'medium'
          }
        }
      )
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
    @geojson
  end


  private
  #a few methods for sorting by date/country/deaths,
  #locking down parameter name/value pairs.



  def sort_column
    Strike.column_names.include?(params[:sort]) ? params[:sort] : "date"
      #raise params.inspect
    end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def self.column_names
    self.fields.collect { |field| field[0] }
  end
end