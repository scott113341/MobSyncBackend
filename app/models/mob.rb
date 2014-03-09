require 'apns'

class Mob < ActiveRecord::Base
  before_create :send_push

  def users
    User.find(self.user_ids.split(','))
  end

  def send_push
    APNS.pem = 'app/assets/cert.pem'

    users.each do |user|
      puts user.device_id
      APNS.send_notification(user.device_id, 'Meow!')
    end
  end
end
