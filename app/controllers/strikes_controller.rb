class StrikesController < ApplicationController

  def index
    @strikes = Strike.all.to_a
  end

  def show
    @strike = Strike.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @nerds }
    end




    render json: @strike
  end

end