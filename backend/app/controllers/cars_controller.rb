class CarsController < ApplicationController
before_action :find_car, only: [:destroy]
  def index
    hash = {cars: Car.all, specs:{}}
    cars = Car.all
    i = 0
    cars.each do |car| 

      final_top_speed = car.calculate_final_top_speed
      final_handling = car.calculate_final_handling
      final_acceleration = car.calculate_final_acceleration
      final_weight = car.calculate_final_weight
      hash[:specs]["car" + i.to_s] = {final_top_speed: final_top_speed, final_handling:final_handling, final_acceleration:final_acceleration, final_weight: final_weight}

      i+=1
    end
    render json: hash
  end
  def new 
    car = Car.new 
  end
  def create
    if Car.all.count < 3
      case car_params[:model]
      when "Tahoe"
        car = Car.create(make: "Chevy", model: "Tahoe", year: 2020, weight: 5880, base_top_speed: 130, base_acceleration: 50, base_handling: 45)
      when "F-150"
        car = Car.create(make: "Ford", model: "F-150", year: 2019, weight: 3600,base_top_speed: 130, base_acceleration: 50, base_handling: 45)  
      when "370z"
        car = Car.create(make: "Nissan", model: "F-150", year: 2018, weight: 2400,base_top_speed: 170, base_acceleration: 60, base_handling: 55)
      when "Mustang"
        car = Car.create(make: "Ford", model: "Mustang", year: 2019, weight: 2600,base_top_speed: 180, base_acceleration: 70, base_handling: 55)  
      when "Corvette"
        car = Car.create(make: "Chevy", model: "Corvette", year: 2015, weight: 2900,base_top_speed: 200, base_acceleration: 75, base_handling: 65)
      end
    render json: car
    else 
      render json: { message: "The garage is full!"}
    end

  end

  def destroy 
    car.destroy
  end
  private
  def find_car 
    car = Car.find(params[:id])
  end
  def car_params
    params.require(:car).permit(:model)
  end
end
