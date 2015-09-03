class Website < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  validates_presence_of :name
  after_create :check_status

  def check_status
    responses.create(status: 123)
  end
end
