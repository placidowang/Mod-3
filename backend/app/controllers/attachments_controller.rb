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
        names = ["Nitro", "Spoiler", "Spikes", "Tint", "Fuzzy Dice"]
        newName = names.sample
        newWeight = rand(50)

        Attachment.create(name: newName, weight: newWeight)
    end
    def edit
    
    end
    def update 
        attachment.update(strong_params(:name))
    end
    def delete 
        attachment.destroy
    end
    private 
    def current_attachment
        attachment = Attachment.find(params[:id])
    end
    def strong_params(*args)
        params.require(:attachment).permit(*args)
    end
   
end
