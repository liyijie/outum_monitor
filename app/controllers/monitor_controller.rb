class MonitorController < ApplicationController
  def all
    @clients = Client.all
    @controller = controller_name
    @action = action_name

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients;    puts "clients size is:#{@clients.size}" }
    end
  end

  def online
    @clients = Client.onlines
    @controller = controller_name
    @action = action_name

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients;    puts "clients size is:#{@clients.size}" }
    end
  end
end
