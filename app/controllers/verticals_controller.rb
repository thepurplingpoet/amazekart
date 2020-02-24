
class VerticalsController < ApplicationController

  def show
    @vertical = Vertical.find(params[:id])
  end
  
end
