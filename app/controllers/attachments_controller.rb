class AttachmentsController < ApplicationController
  def purge
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge # or use purge_later
    flash[:success] = 'success'

    redirect_back fallback_location: ads_path
  end
end
