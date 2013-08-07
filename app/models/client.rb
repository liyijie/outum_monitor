class Client < ActiveRecord::Base
  attr_accessible :label, :last_time

  has_many :records, dependent: :destroy

  def recent_record
    records = self.records.last
  end

  def online_days
    self.records.count
  end

  def record_today
    self.records.find_by_date(Time.zone.now.to_date)
  end

  def distance_all
    self.records.sum('distance')
  end

  def distance_today
    today_record = record_today
    distance = today_record ? today_record.distance : 0.0
  end

  def duration_all
    self.records.sum('duration')
  end

  def duration_today
    today_record = record_today
    duration = today_record ? today_record.duration : 0.0
  end

end
