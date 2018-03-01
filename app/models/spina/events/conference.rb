module Spina::Events
  class Conference < ApplicationRecord
    extend FriendlyId

    friendly_id :title, use: :slugged

    belongs_to :photo, optional: true
    belongs_to :attachment, optional: true
    belongs_to :venue
    validates :title, :description, :start_date, :end_date, presence: true

    # Create a 301 redirect if the slug changed
    after_save :rewrite_rule, if: -> { saved_change_to_slug? }

    scope :draft, -> { where(draft: true) }
    scope :live, -> { where(draft: false) }

    private

    def should_generate_new_friendly_id?
      slug.blank? || draft_changed? || super
    end

    def rewrite_rule
      Spina::RewriteRule.create(old_path: "/conferences/#{slug_before_last_save}", new_path: "/conferences/#{slug}")
    end
  end
end
