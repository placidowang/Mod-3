class AttachmentsController < ApplicationController
    before_action :current_attachment, only: [:show,:edit,:update,:delete]

    def index 
        attachments = Attachment.all
        render json: attachments, include: [:part, :car]
    end
    def show 
        render json: attachment
    end
    def create
        attachments = [
            {name: "SPOILER", weight: 5, img_url: 'https://image.shutterstock.com/image-photo/car-part-close-detail-custom-260nw-438635593.jpg',change_in_top_speed: -5, change_in_acceleration: -4, change_in_handling: -10},
            {name: "NITRO", weight: 25, img_url: 'https://www.autoguide.com/blog/wp-content/uploads/2012/10/garrett-turbocharger.jpg',change_in_top_speed: 50, change_in_acceleration: 30, change_in_handling: -20},
            {name: "SPIKES", weight: 5, img_url: 'https://images-na.ssl-images-amazon.com/images/I/61O1lvW0NML._AC_SL1400_.jpg',change_in_top_speed: -5, change_in_acceleration: -4, change_in_handling: -10},
            {name: "STRIPES", weight: 0, img_url: 'https://static1.squarespace.com/static/5a47d2a37131a598444003fc/5a86e91b7de07549b56cc2f3/5a8d9488e2c483e3e3a01610/1519998803109/racing-stripes-mercedes.jpg?format=1500w',change_in_top_speed: 0, change_in_acceleration: 0, change_in_handling:0}
        ]
        attachment = Attachment.create(attachments.sample)
        render json: attachment
    end
    def edit
    
    end
    def update 
        attachment.update(strong_params(:name))
    end
    def destroy
        attachment = Attachment.find(params[:id])
        attachment.destroy
        render json: attachment
    end
    private 
    def current_attachment
        attachment = Attachment.find(params[:id])
    end
    def strong_params(*args)
        params.require(:attachment).permit(*args)
    end
   
end
