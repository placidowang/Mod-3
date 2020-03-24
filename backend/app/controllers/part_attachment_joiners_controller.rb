class PartAttachmentJoinersController < ApplicationController
  def create
    PartAttachmentJoiner.create(part_attachment_params)
  end

  def edit
  end

  def update
    part_attachment = PartAttachmentJoiner.find(params[:id])
    part_attachment.update(part_attachment_params)
  end

  def destroy
    part_attachment = PartAttachmentJoiner.find(params[:id])
    part_attachment.destroy
  end

  private
  def part_attachment_params
    params.require(:part_attachment_joiner).permit(:part_id, :attachment_id)
  end
end
