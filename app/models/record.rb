class Record < ActiveRecord::Base
  attr_accessible :client_id, :date, :distance, :imei, :last_time, :lat, :lon, :ue, :duration

  belongs_to :client

  
end
