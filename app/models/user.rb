class User < ActiveRecord::Base
  has_many :participants
  has_many :mobs, through: :participants

  validates_presence_of :username, :password, :name, :device_id
  validates_uniqueness_of :username

  before_create :format_device_id

  def format_device_id
    self.device_id = self.device_id.gsub('<','').gsub('>','').gsub(' ','')
  end
end
