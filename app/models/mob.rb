require 'apns'

class Mob < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  has_many :participants
  has_many :users, through: :participants

  validates_presence_of :user_id, :user_idz, :destination, :unix_timestamp

  before_create :set_unix_timestamp
  after_create :create_participants, :send_push_notification

  def user
    User.find(self.user_id)
  end

  def set_unix_timestamp
    self.unix_timestamp = Time.now.to_i
  end

  def create_participants
    self.user_idz.split(',').each do |user_id|
      Participant.create(mob_id: self.id, user_id: user_id)
    end
  end

  def send_push_notification
    APNS.pem = 'app/assets/cert.pem'

    self.participants.each do |participant|
      params = {
        :alert => "You have #{pluralize participant.mob.participants.count-1, 'friend'} mobbing to #{participant.mob.destination}!",
        :other => {
          :mob_id => self.id
        }
      }

      APNS.send_notification(participant.user.device_id, params)
    end
  end
end
