class Webhook < ApplicationRecord
  validates_format_of :endpoint_url, :with => URI.regexp(['https'])

  belongs_to :user

  has_many :webhook_attempts
end
