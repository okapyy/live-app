class VideosController < ApplicationController

  before_action :move_to_index, except:[:index]

  def index
    @videos = Video.includes(:users).order("created_at DESC").page(params[:page]).per(6)
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    Video.create(video_params)
    redirect_to root_path
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    video = Video.find(params[:id]) && video.video.recreate_versions!
    video.update(video_params)
    redirect_to video_path(video)
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    redirect_to root_path
  end

  private
  def video_params
    params.require(:video).permit(:video, :artist, :song_title, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
