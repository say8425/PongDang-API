class DegreesController < ApplicationController
  def index
    render json: { data: Degree.latest }
  end
end
