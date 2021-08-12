class Message < ApplicationRecord
    belongs_to :writer, polymorphic: true
    belongs_to :receiver, polymorphic: true
end
