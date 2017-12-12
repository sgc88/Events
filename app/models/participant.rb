class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user
  event.participants << user
end
