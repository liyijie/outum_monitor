class HomeController < ApplicationController
  def index
    @controller = controller_name
    @action = action_name
    @videos = Video.all
    @row_count = @videos.size / 3 + (@videos.size % 3 > 0 ? 1 : 0)
  end
end
