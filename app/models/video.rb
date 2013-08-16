class Video < ActiveRecord::Base
  attr_accessible :note, :title
  has_many :attachments, as: :attachmentable, dependent: :destroy

  acts_as_list
  default_scope order('position')

  def video_attachment
    attachments.find_by_file_type "video"
  end

  def photo_attachment
    attachments.find_by_file_type "image"
  end
end