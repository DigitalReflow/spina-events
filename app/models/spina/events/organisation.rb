require_dependency 'spina/events'

module Spina
  class Events::Organisation < ApplicationRecord
    extend FriendlyId

    friendly_id :name, use: :slugged

    belongs_to :photo, optional: true
    validates :name, presence: true

    # Create a 301 redirect if the slug changed
    after_save :rewrite_rule, if: -> { saved_change_to_slug? }

    private

    def should_generate_new_friendly_id?
      slug.blank? || super
    end

    def rewrite_rule
      RewriteRule.create(old_path: "/events/organisations/#{slug_before_last_save}", new_path: "/events/organisations/#{slug}")
    end
  end
end
