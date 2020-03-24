class CarsController < ApplicationController
before_action :find_car, only: [:destroy]
  def index
    cars = Car.all
    render json: cars
  end
  def new 
    car = Car.new 
  end 
  def create 
    car = Car.create(car_params(:weight,:make,:model,:year))
  end

  def destroy 
    car.destroy
  end
  private
  def find_car 
    car = Car.find(params[:id])
  end
  def car_params 
    params.require(:car).permit(*args)
  end
end
