class StrikesController < ApplicationController

  require 'will_paginate/array'
  helper_method :sort_column, :sort_direction

  def index
    #raise params.inspect
    #if params[:year] =! nil
    #  @strikes = Strike.search(params[:year]).order_by(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    #else  
    #  
    #end
    @strikes = Strike.search(params[:search]).order_by(sort_column + ' ' + sort_direction).paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @strikes }
      format.js
    end

    #dates = [10,11,12,13,14,15,16]
    #@graph = LazyHighCharts::HighChart.new('graph') do |f|
    #  f.xAxis(:categories => dates)
    #  f.series(:type => 'spline', :name => 'Average', :data => [1,2,3,4,5,6,7], :color => '#b20838', marker: {enabled: false})
    #  f.legend({:align => 'right', :y => 10, :verticalAlign => 'top', :floating => "true", :borderWidth => 0})
    #end

    #@bar = LazyHighCharts::HighChart.new('column') do |f|
    #  f.series(:name=>'John',:data=> [3, 20, 3, 5, 4, 10, 12 ])
    #  f.series(:name=>'Jane',:data=>[1, 3, 4, 3, 3, 5, 4,-46])     
    #  f.title({ :text=>"example test title from controller"})

      ###  Options for Bar
      ### f.options[:chart][:defaultSeriesType] = "bar"
      ### f.plot_options({:series=>{:stacking=>"normal"}}) 

      ## or options for column
    #  f.options[:chart][:defaultSeriesType] = "column"
    #  f.plot_options({:column=>{:stacking=>"percent"}})
    #end
  end

  def show
    @strike = Strike.find(params[:id])

    respond_to do |format|
        format.html #show.html.erb
        format.js #show js.erb
        format.json { render json: @strike }
    end
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