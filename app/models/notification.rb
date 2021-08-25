class Notification < ApplicationRecord
    belongs_to :user
    # belongs_to :notification_reason, polymorphic: true

    def source
        user = User.find_by(id: self.source_user_id).platform_user 
    end



end
