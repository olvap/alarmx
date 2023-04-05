class EventCondition < ApplicationRecord
  belongs_to :sensor
  belongs_to :event
end
