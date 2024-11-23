module ApplicationHelper
  def cdn_url(attachment)
    if Rails.application.config.cdn_host.present?
      URI.join(Rails.application.config.cdn_host, attachment.blob.key).to_s
    else
      rails_blob_url(attachment)
    end
  end
end
