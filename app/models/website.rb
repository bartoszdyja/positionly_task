class Website < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  after_create :check_status

  def check_status
    responses.create(status: 123)
  end
end
