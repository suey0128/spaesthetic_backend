class Collab < ApplicationRecord
    belongs_to :content_creator
    belongs_to :campaign
end
