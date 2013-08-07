module Outum
  class API < Grape::API
    
    version 'v1', using: :header, vendor: 'outum'
    format :json

    helpers do

    end

    resource :monitor do
      desc "submit a client online infomation"

      params do
        requires :client_id, type: String, desc: "client id"
      end
      post ':client_id' do
        time = Time.zone.now
        # 查找是否有对应client的信息，如果没有则创建一个
        client = Client.find_by_label params[:client_id]
        if client.nil?
          client = Client.new
          client.label = params[:client_id]
        end

        client.last_time = time
        client.save

        # 客户端的信息保护以下内容：
        # 终端类型，终端IMEI，经度，纬度
        # 程序填充：日期、时间、里程
        ue = params[:ue]
        imei = params[:imei]
        lat = params[:lat]
        lon = params[:lon]
        
        # 1. 对于同一天的数据需要更新
        # 2. 更新的时，需要根据之前的结果更新在线时长和里程
        # 3. 如果不存在之前一天的数据，则新建一条数据
        record = client.records.find_by_date(time.to_date) || client.records.new
        record.ue = ue if ue
        record.imei = imei if imei
        record.update_info lat, lon, time

        record.save
      end
    end

  end
end