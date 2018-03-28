module Spina::Events
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
