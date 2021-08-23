class DirectMessage < ApplicationRecord
    belongs_to :writer, class_name: "User"
    belongs_to :receiver, class_name: "User"
end
