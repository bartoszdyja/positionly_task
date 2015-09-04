class WebsiteWorker
  include Sidekiq::Worker
  def perform(name)
    Website.all.each do  |w|
      w.check_status
    end
  end
end