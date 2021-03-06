class AttachmentsController < ApplicationController
  def purge
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge # or use purge_later
    flash[:success] = t('controllers.attachments.image_delete')

    redirect_back fallback_location: ads_path
  end
end
