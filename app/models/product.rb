class Product < ActiveRecord::Base
  attr_accessible :attachment, :download_count, :release_date, :release_note, :statble, :release_version

  has_one :attachment, as: :attachmentable, dependent: :destroy

  acts_as_list
  default_scope order('position desc')
end
