class Attachment < ActiveRecord::Base
  attr_accessible :attachmentable_id, :attachmentable_type, :content_type, :file_name, :file_size, :media, :file_type
  attr_accessible :attachmentable

  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/  
  
  mount_uploader :media, MediaUploader

  belongs_to :attachmentable, polymorphic: true

  validates :attachmentable, presence: true
  validates :media, presence: true

  before_save :set_attachment_attributes

  protected

  def set_attachment_attributes
    if media.present? && media_changed?
      self.content_type = media.file.content_type
      self.file_size = media.file.size
      self.file_name = media.file.original_filename
      self.file_type = media.file.content_type.include?('image') ? "image" : "video"
    end
  end

end
