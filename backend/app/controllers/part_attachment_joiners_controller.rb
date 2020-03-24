class PartAttachmentJoinersController < ApplicationController
  def create
    pa_joiner = PartAttachmentJoiner.create(part_attachment_params)
    render json: pa_joiner
  end

  def edit
  end

  def update
    # pa_joiner = PartAttachmentJoiner.find(params[:id])
    # pa_joiner.update(part_attachment_params)
  end

  def destroy
    pa_joiner = PartAttachmentJoiner.find(params[:id])
    pa_joiner.destroy
  end

  private
  def part_attachment_params
    params.require(:part_attachment_joiner).permit(:part_id, :attachment_id)
  end
end
