class User < ActiveRecord::Base
  before_create :format_device_id

  def format_device_id
    self.device_id = self.device_id.gsub('<','').gsub('>','').gsub(' ','')
  end
end
