class Client < ActiveRecord::Base
  attr_accessible :label, :last_time

  has_many :records, dependent: :destroy

  def recent_record
    records = self.records.last
  end

end
