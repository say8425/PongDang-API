class DegreesController < ApplicationController
  def index
    degree = SeoulData.han_river_degree
    render json: { data: degree }
  end
end
