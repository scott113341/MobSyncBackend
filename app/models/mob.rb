class Mob < ActiveRecord::Base
  def users
    User.find(self.user_ids.split(','))
  end
end
