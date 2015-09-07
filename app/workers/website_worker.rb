class WebsiteWorker
  include Sidekiq::Worker
  def perform
    while true
      Website.all.each do  |w|
        if w.last_update< 10.minutes.ago
          w.check_status
          p 'sprawdzam' + Time.now
        end
      end
      sleep 5
    end
  end
end