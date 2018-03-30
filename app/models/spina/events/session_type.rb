module Spina::Events
  class SessionType < ApplicationRecord
    belongs_to :session
    validates :name, presence: true
  end
end
