require 'apns'

class Mob < ActiveRecord::Base
  before_create :send_push_notification

  def users
    User.find(self.user_ids.split(','))
  end

  def send_push_notification
    APNS.pem = 'app/assets/cert.pem'

    users.each do |user|
      params = {
        :alert => 'Meow!',
        :badge => 0,
        :other => {
          :mob => self.attributes
        }
      }

      APNS.send_notification(user.device_id, params)
    end
  end
end
