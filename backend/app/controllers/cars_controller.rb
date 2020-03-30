class CarsController < ApplicationController
  before_action :find_car, only: [:show, :specs, :destroy] # not actually doing anything?

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
        car = Car.create(make: "CHEVY", model: "TAHOE", year: 2020, weight: 5880, base_top_speed: 130, base_acceleration: 50, base_handling: 45, img_url:'https://c4d709dd302a2586107d-f8305d22c3db1fdd6f8607b49e47a10c.ssl.cf1.rackcdn.com/thumbnails/stock-images/f135b26bb60851043cb53961c1467c1e.png')
      when "F-150"
        car = Car.create(make: "FORD", model: "F-150", year: 2019, weight: 3600,base_top_speed: 130, base_acceleration: 50, base_handling: 45, img_url:'https://www.bobmooreford.com/inventoryphotos/7127/1ftew1e47kke91390/sp/1.jpg?height=400')  
      when "370z"
        car = Car.create(make: "NISSAN", model: "370z", year: 2018, weight: 2400,base_top_speed: 170, base_acceleration: 60, base_handling: 55, img_url:'https://s.aolcdn.com/commerce/autodata/images/CAC80NIC141A021001.jpg')
      when "Mustang"
        car = Car.create(make: "FORD", model: "MUSTANG", year: 2019, weight: 2600,base_top_speed: 180, base_acceleration: 70, base_handling: 55, img_url:'https://www.earnhardtford.com/inventoryphotos/4905/1fa6p8cfxk5169393/sp/1.jpg?height=400')  
      when "Corvette"
        car = Car.create(make: "CHEVY", model: "CORVETTE", year: 2015, weight: 2900,base_top_speed: 200, base_acceleration: 75, base_handling: 65, img_url:'https://images.newcartestdrive.com/wp-content/uploads/2014/07/15s-z06conv-1.jpg')
      when "S2000"
        car = Car.create(make: "HONDA", model: "S2000", year: 2006, weight: 2880, base_top_speed: 164, base_acceleration:50, base_handling: 24, img_url: 'https://cdn-w.v12soft.com/photos/U1ajuAw/12266569/r640_2_800600.jpg')
      end
      render json: car
    else 
      render json: { message: "The garage is full!"}
    end
  end

  def show
    # byebug
    car = Car.find(params[:id])

    specs = {}
    specs[:final_top_speed] = car.calculate_final_top_speed
    render json: specs
  end

  def specs
    car = Car.find(params[:id])
    # {final_top_speed: final_top_speed, final_handling:final_handling, final_acceleration:final_acceleration, final_weight: final_weight}
    specs = {}
    specs[:final_top_speed] = car.calculate_final_top_speed
    specs[:final_handling] = car.calculate_final_handling
    specs[:final_acceleration] = car.calculate_final_acceleration
    specs[:final_weight] = car.calculate_final_weight
    render json: specs
  end

  def destroy 
    car = Car.find(params[:id])
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
