class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :mob

  validates_presence_of :mob_id, :user_id
end
