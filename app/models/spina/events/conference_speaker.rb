module Spina::Events
  class ConferenceSpeaker < ApplicationRecord
    belongs_to :conference
    belongs_to :speaker
  end
end