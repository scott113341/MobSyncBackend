class User < ActiveRecord::Base
  has_many :participants
  has_many :mobs, through: :participants

  before_create :format_device_id

  def format_device_id
    self.device_id = self.device_id.gsub('<','').gsub('>','').gsub(' ','')
  end
end
