require 'apns'

class Mob < ActiveRecord::Base
  before_create :send_push

  def users
    User.find(self.user_ids.split(','))
  end

  private

  def send_push
    puts 'meowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww'
    puts self.attributes.to_s
  end
end
