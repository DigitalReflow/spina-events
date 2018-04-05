module Spina::Events
  class SessionType < ApplicationRecord
    has_many :sessions
    validates :name, presence: true
  end
end
