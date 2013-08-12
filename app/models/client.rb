class Client < ActiveRecord::Base
  attr_accessible :label, :last_time

  has_many :records, dependent: :destroy

  def recent_record
    records = self.records.last
  end

  def online_days
    self.records.count
  end

  def recent_city
    self.recent_record.city if self.recent_record
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

  def lat
    lat = recent_record ? recent_record.lat : nil
  end

  def lon
    lon = recent_record ? recent_record.lon : nil
  end

  def as_json(options)
    json_data = {}
    json_data[:label] = label
    json_data[:last_time] = last_time
    json_data[:lat] = lat if lat
    json_data[:lon] = lon if lon
    json_data
  end

end
