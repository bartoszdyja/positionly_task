class WebsitesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @website =Website.new
    @websites = current_user.websites.order('created_at DESC')
  end

  def create
    @website = Website.new(website_params)
    @website.user = current_user
    if @website.save
      redirect_to root_path
    end
  end

  def destroy
    current_user.websites.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def website_params
    params.require(:website).permit(:name)
  end
end
