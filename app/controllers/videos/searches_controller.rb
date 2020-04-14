class Videos::SearchesController < ApplicationController

  def index
    @videos = Video.search(params[:keyword])
  end

end
