class AttachmentsController < ApplicationController
    def index 
        attachments = Attachment.all
        render json: attachments, only: [:name]
    end
    def show 
        attachment = Attachment.find(params[:id])
        render json: attachment
    end
    def edit
        attachment = Attachment.find(params[:id])
    end
    def update 
        attachment = Attachment.find(params[:id])
        attachment.update(name: params[:name])
    end
    def delete 
        attachment = Attachment.find(params[:id])
        attachment.destroy

    end
    
end
