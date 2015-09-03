class Website < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  validates_presence_of :name
  after_create :check_status

  def check_status
    start_time = Time.now
    response = Faraday.get name
    response_time = Time.now - start_time
    responses.create(status: response.status, response_time: response_time)
  end

  def average_response_time
    responses.average(:response_time)
  end

  def readable_update_time
    time_ago_in_words(3.minutes.from_now)
  end
end
