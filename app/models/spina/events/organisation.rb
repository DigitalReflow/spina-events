module Spina::Events
  class Organisation < ApplicationRecord
    extend Mobility
    extend FriendlyId

    friendly_id :name, use: :slugged

    belongs_to :photo, optional: true
    validates :name, presence: true

    translates :name, :website, :slug, :twitter, :linkedin, :facebook

    private

    def should_generate_new_friendly_id?
      slug.blank? || super
    end
  end
end
