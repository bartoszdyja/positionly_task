class Response < ActiveRecord::Base
  belongs_to :website, dependent: :destroy
end
