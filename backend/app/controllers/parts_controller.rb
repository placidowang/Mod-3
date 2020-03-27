class PartsController < ApplicationController
    def index 
        parts = Part.all 
        render json: parts
    end
    
    def create
        parts = ["engine", "wheels", "rear"]
        car_parts = []
        parts.each do |part| 
           car_parts << Part.create(name: part, car_id:part_params[:car_id])
        end
    end

    private 
    def part_params
        params.require(:part).permit(:car_id)
    end

end
