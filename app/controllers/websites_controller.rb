class WebsitesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @websites = current_user.websites
  end
end
