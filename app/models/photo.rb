class Photo < ActiveRecord::Base
  attr_accessible :note, :title
  has_one :attachment, as: :attachmentable, dependent: :destroy
  
  acts_as_list
  default_scope order('position')
end
