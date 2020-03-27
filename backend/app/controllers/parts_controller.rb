class PartsController < ApplicationController
    def index 
        parts = Part.all 
        render json: parts
    end
    
    def create
        # parts = ["engine", "wheels", "rear"]
        car_parts = []
        # parts.each do |part| 
        #    car_parts << Part.create(name: part, car_id:part_params[:car_id])
        # end
        car_parts << Part.create(name: "engine", img_url: 'https://cdn.gearpatrol.com/wp-content/uploads/2017/08/A-Better-911-Engine-Singer-gear-patrol-1.jpg', car_id: part_params[:car_id])
        car_parts << Part.create(name: "wheels", img_url: 'https://i.ebayimg.com/images/g/4iwAAOSwmMNcU~uv/s-l300.jpg', car_id: part_params[:car_id])
        car_parts << Part.create(name: "rear", img_url: 'https://media.istockphoto.com/photos/illustration-of-generic-white-car-rear-angle-picture-id959527066?k=6&m=959527066&s=612x612&w=0&h=SpM04fWsk6WVOntU3cFhK6tCmWQYdnt7GD0rBgmXHT4=', car_id: part_params[:car_id])


        render json: car_parts
    end

    private 
    def part_params
        params.require(:part).permit(:car_id)
    end

end
