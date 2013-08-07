class Record < ActiveRecord::Base
  attr_accessible :client_id, :date, :distance, :imei, :last_time, :lat, :lon, :ue, :duration

  belongs_to :client

  def update_info lat, lon, time
    self.distance ||= 0
    self.duration ||= 0
    if lat && lon
      lng1 = self.lon.to_f
      lat1 = self.lat.to_f
      lng2 = lon.to_f
      lat2 = lat.to_f
      rad = Math::PI / 180.0
      earth_radius = 6378.137 * 1000 #地球半径
      radLat1 = lat1 * rad
      radLat2 = lat2 * rad
      a = radLat1 - radLat2
      b = (lng1 - lng2) * rad
      s = 2 * Math.asin(Math.sqrt( (Math.sin(a/2)**2) + Math.cos(radLat1) * Math.cos(radLat2)* (Math.sin(b/2)**2) ))
      s = s * earth_radius
      s = (s * 10000).round / 10000

      delta_time = self.last_time ? (time - self.last_time) : 0
      puts "delta_time is:#{delta_time}"
      puts "s is:#{s}"

      if delta_time > 0 && delta_time < 60 && (s / delta_time < 1000)
        self.distance += s
        self.duration += delta_time
      end
      self.lat = lat
      self.lon = lon
    end
    self.last_time = time
    self.date = time.to_date
  end

end
